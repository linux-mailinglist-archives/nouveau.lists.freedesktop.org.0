Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B687373A5
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC2B10E313;
	Tue, 20 Jun 2023 18:20:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4F10E167;
 Mon,  5 Jun 2023 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686003380; x=1717539380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j6OmYXev5dSof4jSEuXxwO0jYGsXKhESRMOiQiPGbO8=;
 b=ek/6TtVrlrqh5Jr2gADyO4L7zr0YpEXKhi2HY0GTbFru+FdnESVB1z/S
 ez6GBO9gABtf8Jzzob+cARTRjG7OhNb+z1ELcAfc+lplYVki1W4wdHfar
 +sEpG9pzqqQGn0ejWMNWDB5ltH35ztaYVqa7wWZAoWGg1GxBfJKz4wXz8
 +fYVk0RpmbwtY5qFpPPvfTq2Tir5zP2Qw4HWT6wrvUsoF2eMDCr9N+QEw
 cv0n/hEOvW7pRkmibrYLknOZq0BFhC3FaN7XymsyVAt3W0EeXa/fhpEwb
 84ZBk+dKEwcvSkcKUwbHePXkQEZRa7/MkDUsMov43qd7wjnsZalvQ/E1Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359812698"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="359812698"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686267039"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="686267039"
Received: from twgeistx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.176])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:16:09 -0700
Date: Tue, 6 Jun 2023 00:16:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sui Jingfeng <15330273260@189.cn>
Message-ID: <ZH5epG6rfTOWT6CS@ashyti-mobl2.lan>
References: <20230604205831.3357596-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604205831.3357596-1-15330273260@189.cn>
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:12 +0000
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v2 1/2] vgaarb: various coding
 style and comments fix
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Sui,

On Mon, Jun 05, 2023 at 04:58:30AM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> To keep consistent with vga_iostate_to_str() function, the third argument
> of vga_str_to_iostate() function should be 'unsigned int *'.

I think the real reason is not to keep consistent with
vga_iostate_to_str() but because vga_str_to_iostate() is actually
only taking "unsigned int *" parameters.

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c   | 29 +++++++++++++++--------------
>  include/linux/vgaarb.h |  8 +++-----
>  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 5a696078b382..e40e6e5e5f03 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -61,7 +61,6 @@ static bool vga_arbiter_used;
>  static DEFINE_SPINLOCK(vga_lock);
>  static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>  
> -

drop this change

>  static const char *vga_iostate_to_str(unsigned int iostate)
>  {
>  	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
> @@ -77,10 +76,12 @@ static const char *vga_iostate_to_str(unsigned int iostate)
>  	return "none";
>  }
>  
> -static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
> +static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)

this is OK, it's actually what you are describing in the commit
log, but...

>  {
> -	/* we could in theory hand out locks on IO and mem
> -	 * separately to userspace but it can cause deadlocks */
> +	/*
> +	 * we could in theory hand out locks on IO and mem
> +	 * separately to userspace but it can cause deadlocks
> +	 */

... all the rest needs to go on different patches as it doesn't
have anything to do with what you describe.

Andi
