Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC47FCC8E
	for <lists+nouveau@lfdr.de>; Wed, 29 Nov 2023 03:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B77E10E5F3;
	Wed, 29 Nov 2023 02:09:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0B010E35E
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701223753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaVTVjwPsRLQvhHQX/AWNDhOssIGmmbDVerq5y+xWjc=;
 b=dsNFDOqtd5alsOcWCw4QrKAC4LNN62AZxVhKUCMenysNzqkGCkz8AXbqV0iyaexW+DMiiY
 HkOcbtmhPn5iX3quHwZ819Kr4nGKn2K8LS2M/M1ZtjkTwivYtZg/q0pU6X4dSADytxAY5s
 tZYIzjGnrScwXKapuzmUCf+DBGgIJDQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-isX2gjfMMquF_mzC1trrQw-1; Tue, 28 Nov 2023 21:09:12 -0500
X-MC-Unique: isX2gjfMMquF_mzC1trrQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-548cf45e962so4356080a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 28 Nov 2023 18:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701223751; x=1701828551;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaVTVjwPsRLQvhHQX/AWNDhOssIGmmbDVerq5y+xWjc=;
 b=J4RAZsvNcbE+uvtQuW8XPJNM4JxumLVlAuCo/igrjwVO906M1Sof3BzBxjVGdjIWvF
 s24B2PPddS/OXcwaspCZxWV/BGETRo5Wg8ysAdYNoSSqCOkFWIa8fp/BWo/Hdmpp1OUi
 aOX6bU/eN/gkPFHhStbJyraf1S0kg3zk32FfuHaPr1hxP6WCRb6PsLD8QeAWWQzuhvab
 YbpltidlhwF+MYu6VbDJ5jdKSbS+BZw67ikxiPkkfiuoRx4rVfnbvJ+p5aJqBdVlYAfH
 6tTcrEQoN1+0FEpVOHAAc4QCBkTgRlkwvf5JKQSi3LpRChLxSXT6Yn/K3gagrBBo2kr1
 p3/w==
X-Gm-Message-State: AOJu0YxNvNC9KoJBGxY5jyADTOVZ199ouHfZdjajlBt4zbZ9tZS1A4+F
 Zy52Gi7XifAzBI6BWyekLvFY32qo99WEfP1FxS+g6OzxAkM65Qyym3grn1f70A1BxVJ+5DrG7yx
 ybEKl5Euji8+EH1KsQ7B/rumFag==
X-Received: by 2002:a50:c014:0:b0:548:5629:81d0 with SMTP id
 r20-20020a50c014000000b00548562981d0mr10471187edb.42.1701223751277; 
 Tue, 28 Nov 2023 18:09:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTXj86sNva9Z5Ps9fdWD2v7xHrgnGPL6vZZMQ7VdHN3+53HEGJpmfV2bjKoyYKGVn9NipKGA==
X-Received: by 2002:a50:c014:0:b0:548:5629:81d0 with SMTP id
 r20-20020a50c014000000b00548562981d0mr10471168edb.42.1701223751013; 
 Tue, 28 Nov 2023 18:09:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 eg36-20020a05640228a400b0054bc5624616sm540233edb.53.2023.11.28.18.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 18:09:10 -0800 (PST)
Message-ID: <0dd7741c-b2f0-4593-b286-de918ffe8955@redhat.com>
Date: Wed, 29 Nov 2023 03:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a0293812-c05d-45f0-a535-3f24fe582c02@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau/gsp/r535: remove a stray unlock in
 r535_gsp_rpc_send()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/27/23 13:56, Dan Carpenter wrote:
> This unlock doesn't belong here and it leads to a double unlock in
> the caller, r535_gsp_rpc_push().
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch - applied to drm-misc-fixes.

- Danilo

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index dc44f5c7833f..818e5c73b7a6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -365,10 +365,8 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>   	}
>   
>   	ret = r535_gsp_cmdq_push(gsp, rpc);
> -	if (ret) {
> -		mutex_unlock(&gsp->cmdq.mutex);
> +	if (ret)
>   		return ERR_PTR(ret);
> -	}
>   
>   	if (wait) {
>   		msg = r535_gsp_msg_recv(gsp, fn, repc);

