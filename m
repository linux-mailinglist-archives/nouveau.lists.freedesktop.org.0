Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35423F94E
	for <lists+nouveau@lfdr.de>; Sun,  9 Aug 2020 00:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907E6E29B;
	Sat,  8 Aug 2020 22:21:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 589 seconds by postgrey-1.36 at gabe;
 Sat, 08 Aug 2020 22:21:06 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D846E291;
 Sat,  8 Aug 2020 22:21:06 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 57C8F105E958C;
 Sun,  9 Aug 2020 00:11:15 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id EBFAD448C31; Sun,  9 Aug 2020 00:11:14 +0200 (CEST)
Date: Sun, 9 Aug 2020 00:11:14 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <20200808221114.5rfnys76ozoj62wv@wunner.de>
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-2-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727205357.27839-2-ddadap@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [Nouveau] [PATCH 1/4] drm: retrieve EDID via ACPI _DDC method
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: david1.zhou@amd.com, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.com, dri-devel@lists.freedesktop.com,
 amd-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 03:53:54PM -0500, Daniel Dadap wrote:
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -34,6 +34,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
> +#include <linux/pci.h>

Nit: Alphabetic ordering.

> +static u64 *get_dod_entries(acpi_handle handle, int *count)
> +{
> +	acpi_status status;
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *dod;
> +	int i;
> +	u64 *ret = NULL;

Nits: Reverse christmas tree.
"ret" is a poor name, I'd suggest "entries" or something like that.
The spec says that _DOD is a list of 32-bit values, not 64-bit.

> +	status = acpi_evaluate_object(handle, "_DOD", NULL, &buf);
> +
> +	if (ACPI_FAILURE(status))
> +		return NULL;

Nit: No blank line between function invocation and error check.

> +	dod = buf.pointer;
> +
> +	if (dod == NULL || dod->type != ACPI_TYPE_PACKAGE)
> +		goto done;

Same.

> +	ret = kmalloc_array(dod->package.count, sizeof(*ret), GFP_KERNEL);
> +	if (ret == NULL)
> +		goto done;

Nit: Usually we use "if (!ret)" or "if (ret)".

> +	list_for_each_safe(node, next, &device->children) {

No, that's not safe because the ACPI namespace may change concurrently,
e.g. because a DSDT patch is applied by the user via sysfs.
Use acpi_walk_namespace() with a depth of 1 instead.

> +		for (i = 0; i < num_dod_entries; i++) {
> +			if (adr == dod_entries[i]) {
> +				ret = do_acpi_ddc(child->handle);
> +
> +				if (ret != NULL)
> +					goto done;

I guess ideally we'd want to correlate the display objects with
drm_connectors or at least constrain the search to Display Type
"Internal/Integrated Digital Flat Panel" instead of picking the
first EDID found.  Otherwise we might erroneously use the DDC
for an externally attached display.

> +struct edid *drm_get_edid_acpi(void)
> +{
> +#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)

No, put an empty inline stub in the header file instead of using #ifdef, see:

https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation

Patches 2, 3 and 4 need a "drm/" prefix in the Subject, e.g.
"drm/i915: ".

Please cc all ACPI-related patches to linux-acpi.

Thanks,

Lukas
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
