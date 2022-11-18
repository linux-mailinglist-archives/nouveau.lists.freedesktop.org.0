Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24206630040
	for <lists+nouveau@lfdr.de>; Fri, 18 Nov 2022 23:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179A510E7E8;
	Fri, 18 Nov 2022 22:39:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C647A10E7E6;
 Fri, 18 Nov 2022 22:39:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02BF9627A9;
 Fri, 18 Nov 2022 22:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F4AC433D6;
 Fri, 18 Nov 2022 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668811145;
 bh=7G8ECLw1ELEqxR6Z8QunxLZvnkLl+Xk4JcotDxWZGTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MqNvnouuMLsZXAjO0uvS7Uenbre81ICnQjgiFWQrB1S4P4QV5UroFyWsFOR9omKaU
 FfoR3j0xrx0dXV432YtcMzMicjMJ+QMLDygQqlkFgXa5etVWZUhb3Sshx9uyHyDxan
 qVti8010/ZiFLOu5kV6rH98JcPZHh+XicKWuEbZdpK349/257mTO/mMH01LaVvWtHR
 4oE/WZ5fd00M4qjPRfRCjKBifoKM1v5VcfyUuAIvkmrz4LLw3NfRiNO7f7BsiyGIUv
 9w1R0Hb5afE94Nj8iEUWt5kai2gIS4mbuqs3+9ut6MblR3c2XMNauYsemh9kcpFL2g
 YQcZJsXBui2AA==
Date: Fri, 18 Nov 2022 16:38:52 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Y3gJfLIGUTTdajY4@work>
References: <20221118211207.never.039-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118211207.never.039-kees@kernel.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fb/ga102: Replace zero-length
 array of trailing structs with flex-array
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 01:12:08PM -0800, Kees Cook wrote:
> Zero-length arrays are deprecated[1] and are being replaced with
> flexible array members in support of the ongoing efforts to tighten the
> FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> 
> Replace zero-length array with flexible-array member.
> 
> This results in no differences in binary output.
> 
> [1] https://github.com/KSPP/linux/issues/78
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> index 8c4cd08a7b5f..8b58b668fc0c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
>  	struct {
>  		u32 offset;
>  		u32 size;
> -	} app[0];
> +	} app[];
>  };
>  
>  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> -- 
> 2.34.1
> 
