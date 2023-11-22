Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5817F5172
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 21:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D7810E148;
	Wed, 22 Nov 2023 20:21:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC310E148
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700684488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3BVhZG5LsRAUkYD7e/+h2TH6j1J+jVcWFbi2Qhl1fc=;
 b=G0Nbh4iqBHVTm5efWi6J525mqfzIlHfffkeqj4EJnWd5RBeC+oMcClM5IJTvrlAcwl7u1k
 XOAZmPHjxhg7O+HyxqDMgkzJjVpyH7flMIuYUtkFb1DE1i0qtxZV8umxMQvKpYoyemEuAh
 lpifvUIM9tFXPbOQ5Lw61j7CgCg328c=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-74eR3URnOLWJ7JWnWF1iiQ-1; Wed, 22 Nov 2023 15:21:27 -0500
X-MC-Unique: 74eR3URnOLWJ7JWnWF1iiQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6d7e70f7e77so145811a34.3
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 12:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700684486; x=1701289286;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3BVhZG5LsRAUkYD7e/+h2TH6j1J+jVcWFbi2Qhl1fc=;
 b=XMazP/SJf0NZ7O2EFTex/MXZhsWVRYyTUZieW44h78kUsa+e7csLfcne7S5Bn6T6+F
 oMli7LOZXbJyJuZiWrT+2bDDAMAo40vTH4Q5R+U/3t/Uu/Gq850zNKgazPaHQtoigwSG
 LrJgf+3udWzefwa8E6NS0zbl6LehQ41OOBgOz8XN6Xn7KMcH/u0KaYg85nCP5sUPgbcM
 eppBwfdvNqn7Dfp8dPcWXz6jwG4vX+t8JHrYAR7Ow2uvcZH0a+PIFefQDNyJ1hxXd1sk
 KmHbs8uCRrEZ4iBrZt115Ehi+RYeHzRvW29IayFhxh/iDp+3pbFjvlIvnrUHtm9x9IlI
 qUBQ==
X-Gm-Message-State: AOJu0YyJB6In7xJ5Cgt6VX+hqJv/EmGcgfQEiMrzfR1vAyWlTJXB7QrP
 UV4v0rRaNuNgz6EoyInR6jlJxZONB+/KQFiEH1FmJsBkNyaO0wc6rUiwak+OShKyLwpgyENEolT
 /ZYo0gBLRkmKEJh4dIRBVwkErnw==
X-Received: by 2002:a05:6830:4128:b0:6c6:18c7:7ca2 with SMTP id
 w40-20020a056830412800b006c618c77ca2mr4666272ott.12.1700684486498; 
 Wed, 22 Nov 2023 12:21:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvVrkc3v5No4q2mIgbDR41Xqf/9uVqeJ4fBmgbeOkBmOBDHi5mnqK7zdASidj8R5t6NtsvfA==
X-Received: by 2002:a05:6830:4128:b0:6c6:18c7:7ca2 with SMTP id
 w40-20020a056830412800b006c618c77ca2mr4666252ott.12.1700684486285; 
 Wed, 22 Nov 2023 12:21:26 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a0c9c07000000b0063d5d173a51sm72337qve.50.2023.11.22.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 12:21:25 -0800 (PST)
Message-ID: <76447329d6aaa46625e5cf6fa72e711a2c5fad50.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com,
 daniel@ffwll.ch,  kherbst@redhat.com, dakr@redhat.com
Date: Wed, 22 Nov 2023 15:21:24 -0500
In-Reply-To: <20231122004926.84933-1-yang.lee@linux.alibaba.com>
References: <20231122004926.84933-1-yang.lee@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/fifo: Remove duplicated
 include in chan.c
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Wed, 2023-11-22 at 08:49 +0800, Yang Li wrote:
> ./drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included mor=
e than once.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D7603
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/chan.c
> index 87a62d4ff4bd..7d4716dcd512 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> @@ -24,7 +24,6 @@
>  #include "chan.h"
>  #include "chid.h"
>  #include "cgrp.h"
> -#include "chid.h"
>  #include "runl.h"
>  #include "priv.h"
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

