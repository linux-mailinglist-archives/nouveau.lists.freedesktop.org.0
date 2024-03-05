Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE368719D0
	for <lists+nouveau@lfdr.de>; Tue,  5 Mar 2024 10:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D33F10E04B;
	Tue,  5 Mar 2024 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HUlwYQih";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678AF10E04B
 for <nouveau@lists.freedesktop.org>; Tue,  5 Mar 2024 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709631892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlPaL+1qbcMigBEz3qx7ZtCPheah+YYYXpFOCWieYr8=;
 b=HUlwYQih4N5wc7+8Xz8rUvb279nHybsFh68/BrwydETDQJ5WzpvMN+WTAKP3eEfJqB07+0
 UwCE/Y7f89l4So8DpKrzHREFkxqXD/VtvYUfiUhN2D6wNOqffd01/Evk/1ymVonEnxW+xZ
 opqtXplMDBqooRdxGOG/Xx1cDChdz3g=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-71xfewQTOpWZFsVgzJw4oA-1; Tue, 05 Mar 2024 04:44:51 -0500
X-MC-Unique: 71xfewQTOpWZFsVgzJw4oA-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6e4ddc05b04so2063626a34.0
 for <nouveau@lists.freedesktop.org>; Tue, 05 Mar 2024 01:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709631890; x=1710236690;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qlPaL+1qbcMigBEz3qx7ZtCPheah+YYYXpFOCWieYr8=;
 b=vd/0OjsgGUmAFcw39Sf3kXvHMTgj8qShllT/l1jNa3JgcPuW6N7A8CUT+EtDS9NgQ7
 LrHDzd1p6nNx0qFyJNMz+JS4F17LOm9WF5cX3gHEsE5leyVlkOi4Uf3OEAZqjaaSWNkL
 IA0/6/n5k/NNCdv4CiOIV6ZC1wA5Vpfx39d7nnmfR8jpMCgx4ZckZVVn3xfKMo0M5XD1
 IYtGeU6HPSphyZlvS0s3/WjN3hu2BTRJq3170QyuIWEcDczKjf45YxHsA2A1q50xUya/
 03qknIiXoImDRXRGLsgI1wuj+aTL5Ammy42CW8plD3wn7aY9HTUhcVY9OqXm76TnNtyI
 hIWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+uBOsMsgE9c17xol54ZP1uDbLvv4gOz83yfU2R5PUpGOib4F4s8axXQD63qiVxDLa4e/q7rCit9LIgKOh8MMer1Wq86sU1JCUKuHMhw==
X-Gm-Message-State: AOJu0YyRARBYMBiwJbxqUoyxMV4l7ybD9etFybPse2iun0a8TFId62iN
 8XL+owuK3f66k0ZSpFCShCAuEjBlfe+YHWZ7s58bHrt4XNMpVIQ08eokB3DWL7ZS57/2kzEVZep
 jTMYOkWMCpfL9qEkwWWO+ymTwpha/MuIEdDYUb0VSI7JUhqfMaZhRh6MStIr0t2s=
X-Received: by 2002:a05:620a:5e13:b0:788:33ec:d8a8 with SMTP id
 xz19-20020a05620a5e1300b0078833ecd8a8mr2119018qkn.19.1709630320823; 
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL7ZlquCoZ60Snk3iqt0FcWv+4rmgyNgIzTovW4+l2TWmVx4HZr2FQyZGXyzR6Vzz7p4retg==
X-Received: by 2002:a05:620a:5e13:b0:788:33ec:d8a8 with SMTP id
 xz19-20020a05620a5e1300b0078833ecd8a8mr2119001qkn.19.1709630320559; 
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b0078812f8a042sm3635157qkb.90.2024.03.05.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:18:40 -0800 (PST)
Message-ID: <deaeaceb-bfb0-4dbf-b800-b0debfd3bac9@redhat.com>
Date: Tue, 5 Mar 2024 10:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240304183157.1587152-1-kherbst@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240304183157.1587152-1-kherbst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 3/4/24 19:31, Karol Herbst wrote:
> If VM_BIND is enabled on the client the legacy submission ioctl can't be
> used, however if a client tries to do so regardless it will return an
> error. In this case the clients mutex remained unlocked leading to a
> deadlock inside nouveau_drm_postclose or any other nouveau ioctl call.
> 
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Should add a stable tag for that one, otherwise:

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 49c2bcbef1299..5a887d67dc0e8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -764,7 +764,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   		return -ENOMEM;
>   
>   	if (unlikely(nouveau_cli_uvmm(cli)))
> -		return -ENOSYS;
> +		return nouveau_abi16_put(abi16, -ENOSYS);
>   
>   	list_for_each_entry(temp, &abi16->channels, head) {
>   		if (temp->chan->chid == req->channel) {

