Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06F565F21
	for <lists+nouveau@lfdr.de>; Mon,  4 Jul 2022 23:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F203112066;
	Mon,  4 Jul 2022 21:32:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1043810FAFE
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jul 2022 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656970355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CZe8Sqi7DtJlbJu8xa2TOlRoA4m6XJLDJlm9ljsZMU=;
 b=guHiCIsuHSYLgAK7Et3U+gQiSt3S2+UJ7XJIYKmsGwE9KFpTUh4w7ytaci8F3dYse+ki9S
 +LL7ysWEQWn8qmt5eFDhYpmspBDkyL9IzzKM9w8g5lIUFVatq7fHMXiECqVJ7LAh6R29r5
 3zJoOzOn/8in/9Nx1GrKIBtYu5V7FK8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-yRk5uCEYNHSwP_f_nSvggw-1; Mon, 04 Jul 2022 17:32:32 -0400
X-MC-Unique: yRk5uCEYNHSwP_f_nSvggw-1
Received: by mail-qt1-f200.google.com with SMTP id
 w42-20020a05622a192a00b0031d3a51eac8so7601841qtc.9
 for <nouveau@lists.freedesktop.org>; Mon, 04 Jul 2022 14:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+CZe8Sqi7DtJlbJu8xa2TOlRoA4m6XJLDJlm9ljsZMU=;
 b=urx4SgVXgeFheNmxCso69rcok8V/49GVfvJ00sIrEODXN7Pzpw6WqLyaV4I8O21qh8
 zETKa2SD5QHhfU9cH+z7zxeEmbfdhV5slkrE7K/gxwR3hRT1fxB73MsV/a8727JhLNlJ
 JLRqF8exL1qoqyRKFE7S/YeHXWMQeYF549UvabYfRagrRoDV0SoLd8ghBGsNsO46AaIT
 i+SKXUCIhVWQELCB7NW3UGVsk4Crfxi2OZ+/xZHjj0UqstmWcxvZG49FAYIv+8tMe+NG
 D0sIVYLVDp3ru++amSdS/tPKZe2+c0H6q9ZpAf79lJco2eCgvDJXvjh1l1rV8qmar2g3
 Gldw==
X-Gm-Message-State: AJIora8d77vOpMc32/bH8Fg4Lvdl6opieJLEYk81t1RTMTGSQrWR7uk6
 uDwUKIpl+rFKKcF+DQnd60yNQXaElzszNxg8Be+icrSS1fWMiiiwIX1ul32oLzTukwQVWodc+bR
 FuAtJ+hU/Su3IOwpDUT5MgW+7Lg==
X-Received: by 2002:a05:6214:2a8e:b0:470:911e:9565 with SMTP id
 jr14-20020a0562142a8e00b00470911e9565mr29602432qvb.37.1656970351712; 
 Mon, 04 Jul 2022 14:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYMDnzTOdu6YjQ9ZTKxQBwIiV3zh8YsFLMwenBFFfbrSK9BSxwAVULZ9blVHT+e6pMwUZk9Q==
X-Received: by 2002:a05:6214:2a8e:b0:470:911e:9565 with SMTP id
 jr14-20020a0562142a8e00b00470911e9565mr29602418qvb.37.1656970351439; 
 Mon, 04 Jul 2022 14:32:31 -0700 (PDT)
Received: from [192.168.57.2] ([172.58.188.184])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006afd667535asm16029818qkp.83.2022.07.04.14.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 14:32:30 -0700 (PDT)
Message-ID: <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Date: Mon, 04 Jul 2022 17:32:18 -0400
In-Reply-To: <20220702153904.1696595-1-trix@redhat.com>
References: <20220702153904.1696595-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: set info only when the
 return is not 0
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Currently on flakey internet in the back of a car, so I probably won't be able
to push this until I get back tonight or early tomorrow

On Sat, 2022-07-02 at 11:39 -0400, Tom Rix wrote:
> clang static analysis reports
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right
> operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
>         switch (!!data * *ver) {
>                        ^ ~~~~
> A switch statement with only a default should be reduced to an if.
> 
> If nvbios_pmuEp() returns 0, via the data variable, the output info
> parameter
> is not used.  So set info only when data is not 0.
> 
> The struct nvbios_pmuE only has the type and data elements.  Since both of
> these
> are explicitly set, memset is not needed.  So remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> index b4a308f3cf7b..49e2664a734c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> @@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver, u8
> *hdr,
>              struct nvbios_pmuE *info)
>  {
>         u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
> -       memset(info, 0x00, sizeof(*info));
> -       switch (!!data * *ver) {
> -       default:
> +       if (data) {
>                 info->type = nvbios_rd08(bios, data + 0x00);
>                 info->data = nvbios_rd32(bios, data + 0x02);
> -               break;
>         }
>         return data;
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

