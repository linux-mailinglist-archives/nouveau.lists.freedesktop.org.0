Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E14EA25B
	for <lists+nouveau@lfdr.de>; Mon, 28 Mar 2022 23:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F49710ED97;
	Mon, 28 Mar 2022 21:21:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C87910ED97
 for <nouveau@lists.freedesktop.org>; Mon, 28 Mar 2022 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648502476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ovb2abZLdPXIpDXoFNTL/ZfMzAu8x+Cb7oB/ww9JfYA=;
 b=Lu2gDTSk9Itt07wViwpjPKeg+lSEkxa07hRL6KHkqsdoQp7Czzl8ImFZ1X1Sf7WGkg0ENR
 e4Y3m+aXHFi54kZGTDelhhvdwPyBWCL0VxS8YCAN1rVHWkoLrESn04+Fb3/1LlEVRK69rP
 bDgr/a0f6Em2vWlRb1xxUoXBYYx9rFM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-wqSleiT5O9qumvTuY2K8Cw-1; Mon, 28 Mar 2022 17:21:05 -0400
X-MC-Unique: wqSleiT5O9qumvTuY2K8Cw-1
Received: by mail-qt1-f198.google.com with SMTP id
 h11-20020ac87d4b000000b002e1c9a3ae51so13270401qtb.0
 for <nouveau@lists.freedesktop.org>; Mon, 28 Mar 2022 14:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ovb2abZLdPXIpDXoFNTL/ZfMzAu8x+Cb7oB/ww9JfYA=;
 b=OLZXnedOtitdSwJeag9j3Q/0wwjzLHgqKSunS089iSlQu/Hjjc3s9cirjfJ3xp4JC5
 wcoRQ11xi7wMYP2vWYJWuzf4/d89JyPbDaA41bRnGsrzQqca8skRoqMjG44uhdyaJqlK
 J1X/NGu+WHPYJy8wbkH+dZLPBMn2MRxoUyZ/9YYOpxlOAUeivNiB8HPgDiyA00cES5UI
 YK3Q3hFfmg3kIXr2Hk5/5Am03CdOl3DqdGlO/l15RwA67hP33PXX0QXG9Bixye7MglTK
 VyTSkSgYnxlZQbzicillUgA3RIbNA4E1QYRWsNEyshxwuv/PKYNMex+0XBX6z/DFs3+C
 8ceQ==
X-Gm-Message-State: AOAM532VnRPcL4ISxEimHZbQET/DvB+dnPumF24VYhMBm4FkhlOGpuYi
 Y/Xw7FWP0Aw40RdpfRic15sXat63e4rASQpjjXtdWKbJDWiKSfYb7U2vMJUIp0+hF2evgXK/PD2
 yF1H8PIbdibdJPXfGNHI8DQyRGg==
X-Received: by 2002:ac8:7d84:0:b0:2e2:1ef6:94bb with SMTP id
 c4-20020ac87d84000000b002e21ef694bbmr24837161qtd.348.1648502442442; 
 Mon, 28 Mar 2022 14:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr/xaDRnoX5KQggdrvWhRc+vYS5yUpsvIM+b2oehs7B0Lt4/tR1Ebdv6ok0NtajQHNvYUffQ==
X-Received: by 2002:ac8:7d84:0:b0:2e2:1ef6:94bb with SMTP id
 c4-20020ac87d84000000b002e21ef694bbmr24837135qtd.348.1648502442222; 
 Mon, 28 Mar 2022 14:20:42 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 w17-20020ac857d1000000b002e19feda592sm13392465qta.85.2022.03.28.14.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:20:41 -0700 (PDT)
Message-ID: <30057caf791dd789fe715715d1c1973994a91953.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 28 Mar 2022 17:20:40 -0400
In-Reply-To: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
References: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] dispnv50: atom: fix an incorrect NULL check
 on list iterator
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
Cc: nouveau@lists.freedesktop.org, yangyingliang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, contact@emersion.fr
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to the appropriate repository shortly.

On Sun, 2022-03-27 at 15:39 +0800, Xiaomeng Tong wrote:
> The bug is here:
>         return encoder;
> 
> The list iterator value 'encoder' will *always* be set and non-NULL
> by drm_for_each_encoder_mask(), so it is incorrect to assume that the
> iterator value will be NULL if the list is empty or no element found.
> Otherwise it will bypass some NULL checks and lead to invalid memory
> access passing the check.
> 
> To fix this bug, just return 'encoder' when found, otherwise return
> NULL.
> 
> Cc: stable@vger.kernel.org
> Fixes: 12885ecbfe62d ("drm/nouveau/kms/nvd9-: Add CRC support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/atom.h |  6 +++---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c  | 27 ++++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 8 deletions(-)
> (also 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> index 3d82b3c67dec..93f8f4f64578 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> @@ -160,14 +160,14 @@ nv50_head_atom_get(struct drm_atomic_state *state,
> struct drm_crtc *crtc)
>  static inline struct drm_encoder *
>  nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
>  {
> -       struct drm_encoder *encoder = NULL;
> +       struct drm_encoder *encoder;
>  
>         /* We only ever have a single encoder */
>         drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
>                                   atom->state.encoder_mask)
> -               break;
> +               return encoder;
>  
> -       return encoder;
> +       return NULL;
>  }
>  
>  #define nv50_wndw_atom(p) container_of((p), struct nv50_wndw_atom, state)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index 29428e770f14..b834e8a9ae77 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -390,9 +390,18 @@ void nv50_crc_atomic_check_outp(struct nv50_atom *atom)
>                 struct nv50_head_atom *armh =
> nv50_head_atom(old_crtc_state);
>                 struct nv50_head_atom *asyh =
> nv50_head_atom(new_crtc_state);
>                 struct nv50_outp_atom *outp_atom;
> -               struct nouveau_encoder *outp =
> -                       nv50_real_outp(nv50_head_atom_get_encoder(armh));
> -               struct drm_encoder *encoder = &outp->base.base;
> +               struct nouveau_encoder *outp;
> +               struct drm_encoder *encoder, *enc;
> +
> +               enc = nv50_head_atom_get_encoder(armh);
> +               if (!enc)
> +                       continue;
> +
> +               outp = nv50_real_outp(enc);
> +               if (!outp)
> +                       continue;
> +
> +               encoder = &outp->base.base;
>  
>                 if (!asyh->clr.crc)
>                         continue;
> @@ -443,8 +452,16 @@ void nv50_crc_atomic_set(struct nv50_head *head,
>         struct drm_device *dev = crtc->dev;
>         struct nv50_crc *crc = &head->crc;
>         const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
> -       struct nouveau_encoder *outp =
> -               nv50_real_outp(nv50_head_atom_get_encoder(asyh));
> +       struct nouveau_encoder *outp;
> +       struct drm_encoder *encoder;
> +
> +       encoder = nv50_head_atom_get_encoder(asyh);
> +       if (!encoder)
> +               return;
> +
> +       outp = nv50_real_outp(encoder);
> +       if (!outp)
> +               return;
>  
>         func->set_src(head, outp->or, nv50_crc_source_type(outp, asyh-
> >crc.src),
>                       &crc->ctx[crc->ctx_idx]);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

