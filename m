Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34C572EDDE
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF9310E3E2;
	Tue, 13 Jun 2023 21:27:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D910E3E2
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+GokRaz/CXRCYGtzlxU6A1MiOBFlvyVYnzQfsXLZXg=;
 b=jODNRSJK5y4wjS3vV5peqiUlYG7YlITLTcILOCxY224g+TX5SVS28IEvJSUB7/lbZsI0al
 kyXRfJclLI06RIa7JaYfLlai/ynU9EGAJ8v0u0B6Czlgdcv8DToo9KH0dJYVXcnQOlUg4v
 ykh+yRzJevoK+mDpYFFMUWmQYh1t4r0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-usS8uVvdPcix_ldUKrGjeA-1; Tue, 13 Jun 2023 17:26:59 -0400
X-MC-Unique: usS8uVvdPcix_ldUKrGjeA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b32a11b31bso4620381fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691617; x=1689283617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+GokRaz/CXRCYGtzlxU6A1MiOBFlvyVYnzQfsXLZXg=;
 b=Ovp2BxnGnDJCLNiPSg5gL9+pQQVQqyte5scy4w2GAGMYqDF4eh99DEy4i/EB7f3P0x
 bJu1WtUoYf4dWn2nLzDEvzvIBl0RGJJBvDOSi/T4Ha+DLYqS1AAjx62kCe00e7nbUOVY
 TXMFrFw0Gec9dwVzPZmB8zM2kNgTcSu/sEnJr98h219lM1C/SkrFNc4Aw4aOwAP9dnGN
 /aRpaB3vkuE5eeXht0WoTQtcjYLhdl+D0iKet6gFAWpc0uYhXUDv1FKE5L7FDA5V9+MR
 dzKT/Q0x7QTaS3+pUwdJXg/0Bkt1OQaJUNfzOK0rm0ifsvfm8u64VeILWkbblMFjASvm
 vu7Q==
X-Gm-Message-State: AC+VfDyg+puSOzx4W6LcrqiaIIOVrW8eHc0s16XjDWKDKgQ5mb4SWkGD
 OI8qiu8JfcTaFHfYLGcnhGY7gaTqdqM/DuF0eOpGrh1/xxm5NrTd7HSpJPBsN7KBW/CxaRBPq2X
 jk/DzbSInrQSewj9IfHlzcZBvxQHVDBaJ/16knb7E4w==
X-Received: by 2002:a2e:a36a:0:b0:2b3:461b:e4b4 with SMTP id
 i10-20020a2ea36a000000b002b3461be4b4mr390120ljn.5.1686691617376; 
 Tue, 13 Jun 2023 14:26:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40W5LUZtkdB7kFB9oQZ83y0oKN0Ip23GwRuMRrnBnumEb7amH749RdYjlQVN8Gbh8Ui9NIa6hdhKblB4JPtOI=
X-Received: by 2002:a2e:a36a:0:b0:2b3:461b:e4b4 with SMTP id
 i10-20020a2ea36a000000b002b3461be4b4mr390116ljn.5.1686691617098; Tue, 13 Jun
 2023 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:26:46 +0200
Message-ID: <CACO55tsOXd7DnwmmTYot-RarCTfN-0+Oyh2ysrz+J9KuU0SVkg@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 01/10] drm/nouveau/nvkm: fini object children
 in reverse order
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 2:31=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> Turns out, we're currently tearing down the disp core channel *before*
> the satellite channels (wndw, etc) during suspend.
>
> This makes RM return NV_ERR_NOT_SUPPORTED on attempting to reallocate
> the core channel on resume for some reason, but we probably shouldn't
> be doing it on HW either.
>
> Tear down children in the reverse of allocation order instead.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm=
/nouveau/nvkm/core/object.c
> index 301a5e5b5f7f..7c554c14e884 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> @@ -185,7 +185,7 @@ nvkm_object_fini(struct nvkm_object *object, bool sus=
pend)
>
>         nvif_debug(object, "%s children...\n", action);
>         time =3D ktime_to_us(ktime_get());
> -       list_for_each_entry(child, &object->tree, head) {
> +       list_for_each_entry_reverse(child, &object->tree, head) {
>                 ret =3D nvkm_object_fini(child, suspend);
>                 if (ret && suspend)
>                         goto fail_child;
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

