Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418959B4E1
	for <lists+nouveau@lfdr.de>; Sun, 21 Aug 2022 17:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B37C8CF77;
	Sun, 21 Aug 2022 15:12:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C8D8CF51
 for <nouveau@lists.freedesktop.org>; Sun, 21 Aug 2022 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661094733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjShao5KS7YTUwj6lZ8lmMaiescGPBNdHzi3GWQbqfo=;
 b=F7j4lkXvoZDexvx7Gkr+f8e+v82rwUTD4n11fy+QfdTAlt74/3IuDKPqQznN/lq5f9dw/D
 ICQBxfJ/oTFVuskhTUYSPNObyCghoW8rFvsNC8pIw2eTRnXPOTkJkTJmbGysU2zh8esvty
 HhDxoEp6FT44sMTej88TKxv9iC5PaQI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-UqOfQQybP7iQJxzvj7j4VA-1; Sun, 21 Aug 2022 11:12:11 -0400
X-MC-Unique: UqOfQQybP7iQJxzvj7j4VA-1
Received: by mail-qk1-f197.google.com with SMTP id
 s9-20020a05620a254900b006b54dd4d6deso7842527qko.3
 for <nouveau@lists.freedesktop.org>; Sun, 21 Aug 2022 08:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CjShao5KS7YTUwj6lZ8lmMaiescGPBNdHzi3GWQbqfo=;
 b=7a6hiBBefxYIaO8iTmowchoZ1JTWy965Cl2KQWDok7yL8kwFO8VVmuPQUKwZMXSywb
 yfy/47vIITItV/10yePXiIWsHt7kOTeByyHCkr5Hso5SEt/Fb4DG3E1+ejR+8++8wxzJ
 Ji0NvhliijddVTUd5AeNRANSQDfoluYYvpqOEzLj1e94YxizXgRUTe2fr+8mhQKkKt+j
 MqQVRxWAjoSMU+3bNg1FP6e6SAVidDbFx9t3f7QNTRT3vR+yD0icUy3nVoSXQLlY0j5J
 Crcm6KpIrEam2/kdUWOSe/9iMoD0BboX/59baISAl4cDrjKOubSMbaF0RtuoJ6a052Kj
 9u1g==
X-Gm-Message-State: ACgBeo2KfRphdD3PcE+5TVfIRmgKkpgOKdOEPLeV2gIuWey5Zpb2wb2V
 s8qfwbI+bpbpm50hltLd0gYLXvhW8eLputx0Sr1+cWoFUl/IlShSTwz0/vPEwFfNyxx81bjykRx
 LO6uK1d1B2SlqSHj4x3uDCp/1u9h+MPmWZatZxzwTXA==
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr12672437qty.141.1661094731077; 
 Sun, 21 Aug 2022 08:12:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Yo0YPKD7li1qO/+8j1V5fDwgE7RtNkUu23EP37Cq0Xx9xBuMRVvP/OGSR+LNvBObUlo8zk28WplryB0x2Lrs=
X-Received: by 2002:a05:622a:110e:b0:343:6f02:99fd with SMTP id
 e14-20020a05622a110e00b003436f0299fdmr12672425qty.141.1661094730890; Sun, 21
 Aug 2022 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220821143038.46589-1-wangjianli@cdjrlc.com>
In-Reply-To: <20220821143038.46589-1-wangjianli@cdjrlc.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 21 Aug 2022 17:12:00 +0200
Message-ID: <CACO55ttLv=RtyLHYdOjbQmNGE_DScd0hfn-_Sxoo5+yavAK9Kw@mail.gmail.com>
To: wangjianli <wangjianli@cdjrlc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] subdev/clk: fix repeated words in comments
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

thanks, and I'll push in a moment.

On Sun, Aug 21, 2022 at 4:34 PM wangjianli <wangjianli@cdjrlc.com> wrote:
>
>  Delete the redundant word 'at'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> index a139dafffe06..7c33542f651b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
> @@ -581,7 +581,7 @@ gm20b_clk_prog(struct nvkm_clk *base)
>
>         /*
>          * Interim step for changing DVFS detection settings: low enough
> -        * frequency to be safe at at DVFS coeff = 0.
> +        * frequency to be safe at DVFS coeff = 0.
>          *
>          * 1. If voltage is increasing:
>          * - safe frequency target matches the lowest - old - frequency
> --
> 2.36.1
>

