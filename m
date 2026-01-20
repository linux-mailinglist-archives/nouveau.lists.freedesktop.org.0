Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC57D3C1BC
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 09:20:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F38EE10E579;
	Tue, 20 Jan 2026 08:20:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F419744CB6;
	Tue, 20 Jan 2026 08:12:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768896722;
 b=lE2r5Iom09OUXQ61IRLcAbLOJI7YYhfko99KI8Y4PDsIO4N7+XIKXsqIUxR31WXCKvb03
 v332INIaybuHO0LDk8S3yTe8BTDVSN3M5g00/0S4nR9+dJTlju5j5CrYmXx8JlJbY80PTyk
 uVfnuBuxFfsNb86q84ld2qTNA1w6AoS6ogbqOTgfruQphcBtuqjvlAdx9TKwD+D4gcY2xbx
 nT+yaEVkeD99P/NwAfvnPFTfELLqu3SqpPUvAPopaQq02OyFnsUlYIbVk9hkFyuU2bq9mU3
 3GR6CoLtrABfGKrwYE2AwlRZHBRoUYcEtkZTAVhDMBsSxm5UKQMGO22oAKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768896722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VVhWsOAUDF64KtSb4r79vC9U/ifjJqOPW40xXb0dCas=;
 b=XjplX9PyyW4i06Iu2HgJXMfzYwirIl/zeGImHaVbZGSk5RmFTdTKKmFRTmTLoBQf66zG1
 X8FeECiBovxgUmV57tTUuwSa5JoyHoZqy8iC8dRE7Vwwi6fs0TaX9PBFaMuID/Qe8sZgY8a
 Z59Nw1ODdqh8LkVqYlwK3aARWMCtiUAEqh7StgGZYlgCRbRBbOyV66at4CNBS2ompRcTiyL
 HZ/0tw9vMGdbIPKvGWdOq7VSkeD1+xCDEndKVOYteVJh+48a5IYvW5wbkc9S7WJqDFW/G5u
 ltaOzkOZ/aqTbThDdRk9m4vkvJpjPT3UyFLoRWHOkUE1W5Njad/bi44oJOYA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=suse.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 31FF644C6E
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 08:12:00 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA89210E576
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 08:20:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A63163371C;
	Tue, 20 Jan 2026 08:20:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 717AD3EA63;
	Tue, 20 Jan 2026 08:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uwNoGto6b2kGbwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Jan 2026 08:20:42 +0000
Message-ID: <31595aa7-6fca-4b14-9b5b-c985af0e3b97@suse.de>
Date: Tue, 20 Jan 2026 09:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm, fbcon, vga_switcheroo: Avoid race condition in
 fbcon setup
To: Thomas Zimmermann <tzimmermann@suse.com>
References: <20260120081841.9827-1-tzimmermann@suse.com>
 <20260120081841.9827-2-tzimmermann@suse.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260120081841.9827-2-tzimmermann@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A63163371C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
Message-ID-Hash: IABLMC5OBHFR4DXYHSURZ5HUT2LLCOYH
X-Message-ID-Hash: IABLMC5OBHFR4DXYHSURZ5HUT2LLCOYH
X-MailFrom: tzimmermann@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IABLMC5OBHFR4DXYHSURZ5HUT2LLCOYH/>
Archived-At: 
 <https://lore.freedesktop.org/31595aa7-6fca-4b14-9b5b-c985af0e3b97@suse.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Please ignore. This patch has been merged already.

Am 20.01.26 um 09:13 schrieb Thomas Zimmermann:
> From: Thomas Zimmermann <tzimmermann@suse.de>
>
> Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
> access in fbcon_remap_all(). Without holding the console lock the call
> races with switching outputs.
>
> VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
> function uses struct fb_info.node, which is set by register_framebuffer().
> As the fb-helper code currently sets up VGA switcheroo before registering
> the framebuffer, the value of node is -1 and therefore not a legal value.
> For example, fbcon uses the value within set_con2fb_map() [1] as an index
> into an array.
>
> Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
> result in VGA switching that does not switch fbcon correctly.
>
> Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
> which already holds the console lock. Fbdev calls fbcon_fb_registered()
> from within register_framebuffer(). Serializes the helper with VGA
> switcheroo's call to fbcon_remap_all().
>
> Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
> as parameter, it really only needs the contained fbcon state. Moving the
> call to fbcon initialization is therefore cleaner than before. Only amdgpu,
> i915, nouveau and radeon support vga_switcheroo. For all other drivers,
> this change does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
> Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v2.6.34+
> Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
> (cherry picked from commit eb76d0f5553575599561010f24c277cc5b31d003)
> ---
>   drivers/gpu/drm/drm_fb_helper.c            | 6 ------
>   drivers/gpu/drm/i915/display/intel_fbdev.c | 2 --
>   drivers/gpu/drm/radeon/radeon_fbdev.c      | 3 ---
>   drivers/video/fbdev/core/fbcon.c           | 9 +++++++++
>   4 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index b507c1c008a3e..3915a8b17bc4c 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -32,7 +32,6 @@
>   #include <linux/console.h>
>   #include <linux/pci.h>
>   #include <linux/sysrq.h>
> -#include <linux/vga_switcheroo.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_drv.h>
> @@ -1668,7 +1667,6 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>   static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
>   {
>   	struct drm_client_dev *client = &fb_helper->client;
> -	struct drm_device *dev = fb_helper->dev;
>   	struct drm_fb_helper_surface_size sizes;
>   	int ret;
>   
> @@ -1687,10 +1685,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
>   
>   	strcpy(fb_helper->fb->comm, "[fbcon]");
>   
> -	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
> -	if (dev_is_pci(dev->dev))
> -		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 31d0d695d5671..8bad7e7909f7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -36,7 +36,6 @@
>   #include <linux/string.h>
>   #include <linux/sysrq.h>
>   #include <linux/tty.h>
> -#include <linux/vga_switcheroo.h>
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_fb_helper.h>
> @@ -337,7 +336,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
>   	ifbdev->vma_flags = flags;
>   
>   	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
> -	vga_switcheroo_client_fb_set(pdev, info);
>   	return 0;
>   
>   out_unpin:
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index fb70de29545c6..730efabe05f6b 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -303,7 +303,6 @@ static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
>   	struct radeon_device *rdev = dev->dev_private;
>   
>   	if (fb_helper->info) {
> -		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
>   		drm_helper_force_disable_all(dev);
>   		drm_fb_helper_unregister_info(fb_helper);
>   	} else {
> @@ -342,8 +341,6 @@ static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
>   	if (ret)
>   		goto err_drm_fb_helper_fini;
>   
> -	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
> -
>   	return 0;
>   
>   err_drm_fb_helper_fini:
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 79525ee90e3b2..57b21b6869231 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -64,6 +64,7 @@
>   #include <linux/console.h>
>   #include <linux/string.h>
>   #include <linux/kd.h>
> +#include <linux/pci.h>
>   #include <linux/slab.h>
>   #include <linux/fb.h>
>   #include <linux/fbcon.h>
> @@ -75,6 +76,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/crc32.h> /* For counting font checksums */
>   #include <linux/uaccess.h>
> +#include <linux/vga_switcheroo.h>
>   #include <asm/irq.h>
>   
>   #include "fbcon.h"
> @@ -2909,6 +2911,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
>   
>   	console_lock();
>   
> +	if (info->device && dev_is_pci(info->device))
> +		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
> +
>   	fbcon_registered_fb[info->node] = NULL;
>   	fbcon_num_registered_fb--;
>   
> @@ -3042,6 +3047,10 @@ static int do_fb_registered(struct fb_info *info)
>   		}
>   	}
>   
> +	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
> +	if (info->device && dev_is_pci(info->device))
> +		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
> +
>   	return ret;
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


