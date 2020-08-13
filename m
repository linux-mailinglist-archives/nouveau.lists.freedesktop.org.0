Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0224329E
	for <lists+nouveau@lfdr.de>; Thu, 13 Aug 2020 05:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C76E0A6;
	Thu, 13 Aug 2020 03:05:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B16E02E;
 Thu, 13 Aug 2020 03:05:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 184so3742744wmb.0;
 Wed, 12 Aug 2020 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Myl3bFwznHFNQ2g0jYsBuDlEUVLZ6Z6r5iszfd59ycU=;
 b=QNlQ0blsYkwXBxeGe0XE5iyRHFdVMdR11/SX6mIROSlaycORt2nWCkOCGAeZnLYHAD
 8z9UbTJlUmkBjeW6rUIP9tFOK/yz2O790Jo2qb+yeSfQTllXAq7CTy7jfAHpyr9vVXkH
 GaJfhlYHi3g5cEx6zz0Qg9yzlgo55lEIjCLKZvdbzwD6209s62ukaZ1ODnkyogyjaiD9
 qjo4lSQwjuNSPNXt3095jJsT+r7Yfk9XB5jPwuwNCGzd3uz68MmAJMR/InEoXxt4vFqd
 XM6nOikw7keYiW+m9GDcEeu+BzQBAy1LRQ343bOIb5kQltL8FD58q62CwQNOpKWptju7
 WcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Myl3bFwznHFNQ2g0jYsBuDlEUVLZ6Z6r5iszfd59ycU=;
 b=pns2JXtxQpf7FqjHOK2vxAp2c5DpayTS8fvUDJZ/Q85W/2etR4IT6p25bXgK9clnUX
 lyF/KvFsfzYdqfpYOUZrxmil4CBBoBW1jxW8Uf18GqItQCWyE8/7iZSvu612X8ILubhq
 53oeAzRwjNUk2zNcrZH8GxEZRPnCDGRheAEizwCiGO4jh6IDQN0Cg81kjVuei26lcS18
 cZiWpbQvN8h6RbSfMEGjuThtMwtSsZVf6miClGNx4mXHgNDVvchPbVy+jncSt1yHTTZS
 2unEO+R8xpqtnso+3sMI89Rov6djBaoYCowIP3i5vIgMpGaS4oEcoKY6jD/VTTfo7n0j
 z29Q==
X-Gm-Message-State: AOAM530Tt86rOBRPuZk7FDumTacYBqvCIuY8uxUMxzOUUnQnaQawJF2H
 WhTfpOGCA1mRkfQKrKY/71ZnrYwAhNP7HD3gw40=
X-Google-Smtp-Source: ABdhPJzO62wB9p0C4iQcvSDR5yazEgL+SxiLC+lVba0NxGcwOBnUvEU8yVnOzl3NjKwGf8Zbolyg9vKPUFoEXP+ztPU=
X-Received: by 2002:a05:600c:252:: with SMTP id
 18mr2273491wmj.56.1597287931862; 
 Wed, 12 Aug 2020 20:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-2-ddadap@nvidia.com>
 <20200808221114.5rfnys76ozoj62wv@wunner.de>
 <3aa06548-b7b4-6753-7169-88e9b2d80acc@nvidia.com>
In-Reply-To: <3aa06548-b7b4-6753-7169-88e9b2d80acc@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Aug 2020 23:05:20 -0400
Message-ID: <CADnq5_Mzgb=KsqCzmRc_wc+NB_a7OqkEzfV-upJQ=77B7zcpgA@mail.gmail.com>
To: Daniel Dadap <ddadap@nvidia.com>
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 nouveau <nouveau@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.com,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 10:31 PM Daniel Dadap <ddadap@nvidia.com> wrote:
>
> Thanks, Lukas. I've incorporated your feedback into my local tree, but
> will wait for additional feedback from the individual DRM driver
> maintainers before sending out a series v2.
>
> On 8/8/20 5:11 PM, Lukas Wunner wrote:
> > On Mon, Jul 27, 2020 at 03:53:54PM -0500, Daniel Dadap wrote:
> >> +             for (i = 0; i < num_dod_entries; i++) {
> >> +                     if (adr == dod_entries[i]) {
> >> +                             ret = do_acpi_ddc(child->handle);
> >> +
> >> +                             if (ret != NULL)
> >> +                                     goto done;
> > I guess ideally we'd want to correlate the display objects with
> > drm_connectors or at least constrain the search to Display Type
> > "Internal/Integrated Digital Flat Panel" instead of picking the
> > first EDID found.  Otherwise we might erroneously use the DDC
> > for an externally attached display.
>
>
> Yes, we'd definitely need a way to do this if this functionality ever
> needs to be extended to systems with more than one _DDC method.
> Unfortunately, this will be much easier said than done, since I'm not
> aware of any way to reliably do map _DOD entries to connectors in a GPU
> driver, especially when we're talking about possibly correlating
> connectors on multiple GPUs which mux to the same internal display or
> external connector. All systems which I am aware of that implement ACPI
> _DDC do so for a single internal panel. I don't believe there's any
> reason to ever retrieve an EDID via ACPI _DDC for an external panel, but
> a hypothetical design with multiple internal panels, more than one of
> which needs to retrieve an EDID via ACPI _DDC, would certainly be
> problematic.
>
>
> On at least the system I'm working with for the various switcheroo and
> platform-x86 driver patches I've recently sent off, the dGPU has an ACPI
> _DOD table and one _DDC method corresponding to one of the _DOD entries,
> but the iGPU has neither a _DOD table nor a _DDC method. Either GPU can
> be connected to the internal panel via the dynamically switchable mux,
> and the internal panel's EDID is available via _DDC to allow a
> disconnected GPU to read the EDID. Since only the DGPU has _DOD and
> _DDC, and there's no obvious way to associate connectors on the iGPU
> with connectors on the dGPU, I've implemented the ACPI _DDC EDID
> retrieval with the "first available" implementation you see here. I'm
> open to other ideas if you have them, but didn't see a good way to
> search for the "right" _DDC implementation should there be more than one.
>
>
> As for preventing the ACPI EDID retrieval from being used for external
> panels, I've done this in the individual DRM drivers that call into the
> new drm_edid_acpi() API since it seemed that each DRM driver had its own
> way of distinguishing display connector types. If there's a good way to
> filter for internal panels in DRM core, I'd be happy to do that instead.

I can double check with our ACPI and vbios teams, but I'm not sure
that we ever used the _DDC method on any AMD platforms.  Even if we
did, the driver is still able to get the integrated panel's mode info
via other means.  In general, external connectors would always get the
EDID via i2c or aux.  The only use case we ever had to hardcoding an
EDID was for some really old server chips so they would always think
something was connected if you wanted to attach a crash cart.  That
EDID was stored in the vbios, not ACPI.

As for enumerating which displays were muxed or not and the local
mappings to acpi ids, etc., we had a whole set of ATPX methods to do
that if anyone is interested:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/amd_acpi.h

Alex
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
