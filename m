Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475C7FE48D
	for <lists+nouveau@lfdr.de>; Thu, 30 Nov 2023 01:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC5B10E37E;
	Thu, 30 Nov 2023 00:09:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901510E37E
 for <nouveau@lists.freedesktop.org>; Thu, 30 Nov 2023 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701302941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCyXRa/HRcuMhxSELQ2U4bOOtsV2/Jacvl5LozlvP7c=;
 b=G6JD5hZnPqlRG9zvYxRzrYwIzf0xOcBA+oIU+yJNHc8W8UF6myjqQaNXFzRsjv1J5CmMCc
 eo9Qj5aCci6RH1Wr0Ip+SzKpq7Vzv3D7zHwoiIUJ6TrLaOH1cgLzg7TyUeAhtp0rPJQWC1
 d1JP5THAMZliV6K3qhxKLOZMeXjBjUY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-c-hhtRP1MyWaIfyksrrmLg-1; Wed, 29 Nov 2023 19:09:00 -0500
X-MC-Unique: c-hhtRP1MyWaIfyksrrmLg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a174b4407f9so34625566b.0
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 16:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701302939; x=1701907739;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dCyXRa/HRcuMhxSELQ2U4bOOtsV2/Jacvl5LozlvP7c=;
 b=AKrfv/WjeDUPZVQDGvwmJOZdfRtwselQ0ZaILNOnNAaEdtlEZNwkcvCNtb+5hLlwMV
 JCcgse+LAQTnIz26ngGC2Flwq92MbIcGtXTyrbwsXYj0Q7AKmjMlhgapEFtmPMH5B1pK
 cXQZUfWyPkJMAT2T7I8vy7g9wSrtZZ6mhWMYszie80gM9PonEUAa238QUjGPDaZo/blj
 6XMj/35t/Op5njUnkk01FeUei8skRExNuuRmiAS6VsPL7OaCI49YPCAK/Fxjx0on1yfR
 8NHAIs2jmfEx9YJ7DG/9y4i7n8iSzadWQOQvybTDnBmx8BKffUC+mJ+FZkeUme8TeAR8
 jrCw==
X-Gm-Message-State: AOJu0YxVSUgpidZqv8YFZCQWxK0Dl0F9zGoCAfd3eVnMZTf9W5rOkDA7
 bvKxQqjFdj1Rgd6toSr1lCoRwzfWT9bdW6N8xUWitR7SPOLGJBgGCNKhY3GvlS0dXbk22I22slK
 OFkS6CkN/XbnllK7lMqgk/lkuUg==
X-Received: by 2002:a17:906:a8d:b0:9fe:1681:22c7 with SMTP id
 y13-20020a1709060a8d00b009fe168122c7mr13130030ejf.26.1701302939151; 
 Wed, 29 Nov 2023 16:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtKQWiKVVfzSK2WurxuaaT+/mGIK3WRsRM0Q64/jn5Kal8vzUIheow6+DDV7rwbMg1GSX59w==
X-Received: by 2002:a17:906:a8d:b0:9fe:1681:22c7 with SMTP id
 y13-20020a1709060a8d00b009fe168122c7mr13130025ejf.26.1701302938899; 
 Wed, 29 Nov 2023 16:08:58 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a170906d29300b00a0c3b122a1esm26634ejb.63.2023.11.29.16.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 16:08:58 -0800 (PST)
Message-ID: <feefd689-780c-4314-a020-00826e09472a@redhat.com>
Date: Thu, 30 Nov 2023 01:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yuran Pereira <yuran.pereira@hotmail.com>
References: <GV1PR10MB65637F4BAABFE2D8E261E1DCE8B0A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <GV1PR10MB65637F4BAABFE2D8E261E1DCE8B0A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Removes unnecessary args check
 in nouveau_uvmm_sm_prepare
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/16/23 21:52, Yuran Pereira wrote:
> Checking `args` after calling `op_map_prepare` is unnecessary since
> if `op_map_prepare` was to be called with  NULL args, it would lead
> to a NULL pointer dereference, thus never hitting that check.
> 
> Hence this check can be removed, and a note added to remind users of
> this function to ensure that args != NULL when calling this function
> for a map operation as it was suggested  by Danilo [1]
> 
> [1] https://lore.kernel.org/lkml/6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com
> 
> Suggested-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Applied to drm-misc-next.

> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 5cf892c50f43..c8c3f1b1b604 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -604,6 +604,10 @@ op_unmap_prepare(struct drm_gpuva_op_unmap *u)
>   	drm_gpuva_unmap(u);
>   }
>   
> +/*
> + * Note: @args should not be NULL when calling for
> + * a map operation.
> + */
>   static int
>   nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
>   			struct nouveau_uvma_prealloc *new,
> @@ -624,7 +628,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
>   			if (ret)
>   				goto unwind;
>   
> -			if (args && vmm_get_range) {
> +			if (vmm_get_range) {
>   				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
>   							   vmm_get_range);
>   				if (ret) {

