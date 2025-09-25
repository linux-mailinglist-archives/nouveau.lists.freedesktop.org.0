Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B96BA09F7
	for <lists+nouveau@lfdr.de>; Thu, 25 Sep 2025 18:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071410E990;
	Thu, 25 Sep 2025 16:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="1MiQc2+f";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5Gom3gf+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="1MiQc2+f";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5Gom3gf+";
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGvZJILJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266D10E992
 for <nouveau@lists.freedesktop.org>; Thu, 25 Sep 2025 16:33:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C50A16D66;
 Thu, 25 Sep 2025 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758818030;
 h=from:from:sender:sender:reply-to:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:list-help:
 list-unsubscribe:list-subscribe:list-post;
 bh=N4Q0tJUAw5e/f/f8+v240opUhtYH/hdZDBuDKruZYwI=;
 b=1MiQc2+fQ+JoXFiWUGVu5UffvVT8aWcxNKk8IOVZwz9xfQHH0mbO7ehlrZbQXOyiaCV/Jw
 vHW7UDv74I8nkhgKHQrMERrdRmPN/DzSjRE5T0+zJe5KOFttBf1OCQl92MdorcTcaTGaAV
 LS50UqkquRbBS1aI1QovtCcid79epa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758818030;
 h=from:from:sender:sender:reply-to:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:list-help:
 list-unsubscribe:list-subscribe:list-post;
 bh=N4Q0tJUAw5e/f/f8+v240opUhtYH/hdZDBuDKruZYwI=;
 b=5Gom3gf+TVXB3H+X+7wzfrtMjPnx3jW+X3pTDXzhPhI/toRqpWxX+5+yHcPRiCvdVd0wdA
 +1lh/z04BS0L1wBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=1MiQc2+f;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=5Gom3gf+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758818030;
 h=from:from:sender:sender:reply-to:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:list-help:
 list-unsubscribe:list-subscribe:list-post;
 bh=N4Q0tJUAw5e/f/f8+v240opUhtYH/hdZDBuDKruZYwI=;
 b=1MiQc2+fQ+JoXFiWUGVu5UffvVT8aWcxNKk8IOVZwz9xfQHH0mbO7ehlrZbQXOyiaCV/Jw
 vHW7UDv74I8nkhgKHQrMERrdRmPN/DzSjRE5T0+zJe5KOFttBf1OCQl92MdorcTcaTGaAV
 LS50UqkquRbBS1aI1QovtCcid79epa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758818030;
 h=from:from:sender:sender:reply-to:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:list-id:list-help:
 list-unsubscribe:list-subscribe:list-post;
 bh=N4Q0tJUAw5e/f/f8+v240opUhtYH/hdZDBuDKruZYwI=;
 b=5Gom3gf+TVXB3H+X+7wzfrtMjPnx3jW+X3pTDXzhPhI/toRqpWxX+5+yHcPRiCvdVd0wdA
 +1lh/z04BS0L1wBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 541E8132C9;
 Thu, 25 Sep 2025 16:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2mxCE+5u1WhtaAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 25 Sep 2025 16:33:50 +0000
From: Petr Vorel <pvorel@suse.cz>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH v4] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
Date: Thu, 25 Sep 2025 18:33:46 +0200
Message-ID: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
References: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No
 client certificate requested) by smtp.lore.kernel.org (Postfix) with ESMTPS
 id CA70AC10F1A for <dri-devel@archiver.kernel.org>;
 Thu,  9 May 2024 20:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1]) by
 gabe.freedesktop.org (Postfix) with ESMTP id EC8DC10F41F;
 Thu,  9 May 2024 20:44:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41]) by gabe.freedesktop.org (Postfix) with ESMTPS id 0055210F41F;
 Thu,  9 May 2024 20:44:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41b9dff6be8so10303085e9.3; Thu, 09 May 2024 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20230601;
 t=1715287466; x=1715892266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFnrhs8qbyMrXLDs1SkHJ+Oc5VBjQBEfIG44vO26wpU=;
 b=JGvZJILJRPWUxNL4epCdRC+CUc8fDGzWikEsHje6WperN0OKadWLbdTlN5dUjqkxmd
 6QjdJctVsfnDxawKfszF2nkHBJ2QFZ8EMSXNSkLvkbDg0TE9ByohXIaAskTfMgoJNkqN
 fvAchpXoD9LSIX1TE1ew/zBtxUChKZEvJH4acexlnvp2MoHgi/NRsB3+/V5B+XNeIih2
 q+lMDYPgf5QfK+DzooioJuEG0+tvKMXPR7Mu928xs9hoicuT/oT+OMHlJ/yjbvJQCPZH
 JbuGXsYEtTYblM7F4BTi9vrFICeHsAT5ie/w47UxjYrOY++Ps/k9WMZinJnS1obT+10o Ku6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20230601; t=1715287466; x=1715892266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id :reply-to;
 bh=TFnrhs8qbyMrXLDs1SkHJ+Oc5VBjQBEfIG44vO26wpU=;
 b=Tj/h5v/jEq+Dr5a/JsCnKhlSLn2I+x9LCt/MgFzbguzCffyPguuDGRw1fVGRQEDiCO
 glQ6AQExrcJtQdLJc2t18gcwyIqplUVcvWfLRNy98E8GZfZwdR/qvHJpT6LM12mYpEcw
 fJKD3vaso+/x2Br/ujoW/NMkvxVLz0T3vhmnYc334C4qxOqDmLATewzxq55y+1wFRWbu
 88ytiUaax0Dw2kPPuxE1U2k1xgDtRV/tFjTS2EUf+fOELsmbCXn9EMMhlQ5br0eb4pP1
 I9pKVKLlmzwsId0IMnYzZbMeFiO675A53Js5QO5kSH7sRptKp96MJr1kFteAxhS7Ohuq aXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUptc4tktW3MFoTfkCqr2xi8vf7leqUQgnbQrXQXuAgT64eHUCK12vLaxMKRZN5AS9OKrep030sQ2qM0f3OpQSEcjELV46LIFm3zcqkA==
X-Gm-Message-State: AOJu0YzzBuyIaMwytNKrAusBmWdAqaqOu2kFzddzbbxDEuRGPBgxZMdA
 LXbCc8B94htio8+UV2WhY1IcA1NvhKJNbs7qgiVOVH5YS+WM4uMi50IPOQ==
X-Google-Smtp-Source: AGHT+IGZfwfqgivNWtzN84BpDnUlXhiU2EVaWxcXnrcYGGgHTGeX5et2PfomBGJTXXugANG+a18y5g==
X-Received: by 2002:a05:600c:3b86:b0:41a:a521:9699 with SMTP id
 5b1f17b1804b1-41fea93a0edmr5853025e9.4.1715287465411;
 Thu, 09 May 2024 13:44:25 -0700 (PDT)
Received: from fedora.domain.name ([156.200.207.193]) by smtp.gmail.com with
 ESMTPSA id 5b1f17b1804b1-41fe518a8fasm14662785e9.33.2024.05.09.13.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:44:25 -0700 (PDT)
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.22 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 MAILLIST(-0.20)[mailman];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 HAS_LIST_UNSUB(-0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_LAST(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,collabora.com,redhat.com];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_SEVEN(0.00)[7];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.cz:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9C50A16D66
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.22
X-BeenThere: nouveau@lists.freedesktop.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>

> Allows PTE kind and tile mode on BO create with VM_BIND,
> and adds a GETPARAM to indicate this change. This is needed to support
> modifiers in NVK and ensure correctness when dealing with the nouveau
> GL driver.
> 
> The userspace modifiers implementation this is for can be found here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795
> 
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
>  drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 +++++++++++--------------
>  include/uapi/drm/nouveau_drm.h          |  7 ++++
>  3 files changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 80f74ee0f..47e53e17b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
>  		break;
>  	}
> +	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> +		getparam->value = 1;

FYI the patch causes freezes GUI on NVIDIA GA107GLM RTX A1000 when {un,}plugging
dock. With just this single line reverted "fixes" it. Because I the code looks
perfectly OK, I suspect some problem in Mesa, I reported it [1].

More details in the ticket, but I post snippet of dmesg also here in case the
problem is obvious.

Kind regards,
Petr

[ 2491.400629] [   T3978] usb 1-6: USB disconnect, device number 5
[ 2491.400652] [   T3978] usb 1-6.1: USB disconnect, device number 7
[ 2491.400712] [    T240] pcieport 0000:21:03.0: pciehp: Slot(3): Link Down
[ 2491.400736] [    T240] pcieport 0000:21:03.0: pciehp: Slot(3): Card not present
[ 2491.402380] [    T240] igc 0000:6d:00.0 enp109s0: PHC removed
[ 2491.403032] [    T240] igc 0000:6d:00.0 enp109s0: PCIe link lost, device now detached
[ 2491.404016] [   T3978] usb 1-6.2: USB disconnect, device number 8
[ 2491.405175] [   T3978] usb 1-6.4: USB disconnect, device number 9
[ 2491.405184] [   T3978] usb 1-6.4.4: USB disconnect, device number 10
[ 2491.405193] [   T3978] usb 1-6.4.4.2: USB disconnect, device number 11
[ 2491.440942] [    T244] thinkpad_acpi: undocked from hotplug port replicator
[ 2491.483469] [    T240] pcieport 0000:4a:03.0: Unable to change power state from D3hot to D0, device inaccessible
[ 2491.485458] [    T240] pcieport 0000:4a:02.0: Unable to change power state from D3hot to D0, device inaccessible
[ 2491.487157] [    T240] pcieport 0000:4a:01.0: Unable to change power state from D3hot to D0, device inaccessible
[ 2491.489618] [    T240] pcieport 0000:4a:00.0: Unable to change power state from D3hot to D0, device inaccessible
[ 2491.491320] [    T240] pci_bus 0000:4b: busn_res: [bus 4b] is released
[ 2491.497475] [    T240] pci_bus 0000:4c: busn_res: [bus 4c-56] is released
[ 2491.503333] [    T240] pci_bus 0000:57: busn_res: [bus 57-61] is released
[ 2491.505943] [    T240] pci_bus 0000:62: busn_res: [bus 62-6c] is released
[ 2491.512474] [    T240] pci_bus 0000:6d: busn_res: [bus 6d] is released
[ 2491.513238] [    T240] pci_bus 0000:4a: busn_res: [bus 4a-6d] is released
[ 2491.552238] [   T3481] usb 4-2: USB disconnect, device number 2
[ 2491.552268] [   T3481] usb 4-2.4: USB disconnect, device number 3
[ 2491.552280] [   T3481] usb 4-2.4.4: USB disconnect, device number 4
[ 2491.564055] [   T3978] usb 1-6.4.4.4: USB disconnect, device number 12
[ 2491.959763] [   T3667] thunderbolt 0-3: device disconnected

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/13974

> +		break;
>  	default:
>  		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index db8cbf615..186add400 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
>  	}
>  
>  	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
> -	if (!nouveau_cli_uvmm(cli) || internal) {
> -		/* for BO noVM allocs, don't assign kinds */
> -		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
> -			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
> -			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -				kfree(nvbo);
> -				return ERR_PTR(-EINVAL);
> -			}
>  
> -			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
> -		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> -			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
> -			nvbo->comp = (tile_flags & 0x00030000) >> 16;
> -			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -				kfree(nvbo);
> -				return ERR_PTR(-EINVAL);
> -			}
> -		} else {
> -			nvbo->zeta = (tile_flags & 0x00000007);
> +	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
> +		nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
> +		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +			kfree(nvbo);
> +			return ERR_PTR(-EINVAL);
> +		}
> +
> +		nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
> +	} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +		nvbo->kind = (tile_flags & 0x00007f00) >> 8;
> +		nvbo->comp = (tile_flags & 0x00030000) >> 16;
> +		if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +			kfree(nvbo);
> +			return ERR_PTR(-EINVAL);
>  		}
> -		nvbo->mode = tile_mode;
> +	} else {
> +		nvbo->zeta = (tile_flags & 0x00000007);
> +	}
> +	nvbo->mode = tile_mode;
>  
> +	if (!nouveau_cli_uvmm(cli) || internal) {
>  		/* Determine the desirable target GPU page size for the buffer. */
>  		for (i = 0; i < vmm->page_nr; i++) {
>  			/* Because we cannot currently allow VMM maps to fail
> @@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
>  		}
>  		nvbo->page = vmm->page[pi].shift;
>  	} else {
> -		/* reject other tile flags when in VM mode. */
> -		if (tile_mode)
> -			return ERR_PTR(-EINVAL);
> -		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> -			return ERR_PTR(-EINVAL);
> -
>  		/* Determine the desirable target GPU page size for the buffer. */
>  		for (i = 0; i < vmm->page_nr; i++) {
>  			/* Because we cannot currently allow VMM maps to fail
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index cd84227f1..5402f77ee 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -68,6 +68,13 @@ extern "C" {
>   */
>  #define NOUVEAU_GETPARAM_VRAM_USED 19
>  
> +/*
> + * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> + *
> + * Query whether tile mode and PTE kind are accepted with VM allocs or not.
> + */
> +#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
> +
>  struct drm_nouveau_getparam {
>  	__u64 param;
>  	__u64 value;
