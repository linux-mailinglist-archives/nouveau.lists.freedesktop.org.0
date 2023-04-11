Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AC6DDD60
	for <lists+nouveau@lfdr.de>; Tue, 11 Apr 2023 16:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1210E568;
	Tue, 11 Apr 2023 14:13:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7F10E57D
 for <nouveau@lists.freedesktop.org>; Tue, 11 Apr 2023 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681222386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgWHYZJKqiNl4gOA+tqLLIKQpJrOHM98+Ie5Z3qvOjs=;
 b=KK8QJP65SZWzH8s5TQaUDezYJe349bBhqkPLOSkyPHIxaezJp9W85lU69HCXNny4r15Ksg
 +ruaiznh6B6wmWJmz0P07UyvgIeTQqV7V2q9U4ooAZLyk9IQEq/5RNux1miusMS3MXEn6V
 emXza2dClalLNDOli5dT10+5qYcBxPA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-cPqCraVeOwCFa3igToYAzg-1; Tue, 11 Apr 2023 10:13:05 -0400
X-MC-Unique: cPqCraVeOwCFa3igToYAzg-1
Received: by mail-lj1-f198.google.com with SMTP id
 z7-20020a05651c11c700b0029a6cbad7baso1618415ljo.16
 for <nouveau@lists.freedesktop.org>; Tue, 11 Apr 2023 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681222383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgWHYZJKqiNl4gOA+tqLLIKQpJrOHM98+Ie5Z3qvOjs=;
 b=f940QPKctRn23jNorGSFiK7EDBC3TNULge4CKEIxeXZunPXuJEWKI+zy/BHp2r2om/
 9KaU4dKkbhNJoG4WHWO9jTQJEqJPYKXVVtTb8fhrMn5Lo4dYO2LX2up3fh/+7g9eTds0
 X1dBkq2F8JksuUKDTdeg0kUAXohsQh+YnpYXVGoAymCokdWO2B7gAlY1nwcJRxRtieFX
 v1s32HesrL62/o8XmkWf53Q/nnApOtLIFjssgzgIzzbYU8BA7nIOR0gaaFVlHp9ytvB9
 LIMIfIOug50/f271L3a7ZtX8CYOCcjC3mEjmc7Twx0KvHg3HWgxSuIhAerwaOlrKjogP
 9zBg==
X-Gm-Message-State: AAQBX9eGpxCl/NvqoXMUYXnM/uT75MtRTeM1PslPUE1lefaAVtm/uD7G
 k8zjMcssfWw2Rn3H+Zq4jsN98DGZ2KESkfEUXe+vHhqP13agi1oUmh5vVVpoe66S0yJdF+06WBR
 NjyNOuogl6/QZeqiOmQI8ozlySHCS8C8c5XWnY6s6S4Xzkn6+NKMm
X-Received: by 2002:ac2:54b9:0:b0:4ec:8e1e:60c7 with SMTP id
 w25-20020ac254b9000000b004ec8e1e60c7mr1447477lfk.4.1681222383014; 
 Tue, 11 Apr 2023 07:13:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZJNvA1En0899YIptSvqorm8IgX6qDO8OV/Q4M08zulGPBKcyK2yEfUe2F2T6iaJY/jr6uhrRqFH9MWQjDNWMg=
X-Received: by 2002:ac2:54b9:0:b0:4ec:8e1e:60c7 with SMTP id
 w25-20020ac254b9000000b004ec8e1e60c7mr1447459lfk.4.1681222382653; Tue, 11 Apr
 2023 07:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220924073957.4140388-1-ruanjinjie@huawei.com>
In-Reply-To: <20220924073957.4140388-1-ruanjinjie@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 11 Apr 2023 16:12:51 +0200
Message-ID: <CACO55tuDx0khsqgv6MBBnwKtcB-UwVLQYEfFah4f0WhOLHd0-A@mail.gmail.com>
To: ruanjinjie <ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/disp: make
 gv100_disp_core_mthd_base static
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
 bskeggs@redhat.com, daniel@ffwll.ch, airlied@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Sep 24, 2022 at 10:00=E2=80=AFAM ruanjinjie <ruanjinjie@huawei.com>=
 wrote:
>
> The symbol is not used outside of the file, so mark it static.
>
> Fixes the following warning:
>
> ./drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c:591:1: warning:
> symbol 'gv100_disp_core_mthd_base' was not declared. Should it be static?
>
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/gv100.c
> index 6b9d49270fa7..347c12a1fcb7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> @@ -587,7 +587,7 @@ gv100_disp_curs =3D {
>         .user =3D 73,
>  };
>
> -const struct nvkm_disp_mthd_list
> +static const struct nvkm_disp_mthd_list
>  gv100_disp_core_mthd_base =3D {
>         .mthd =3D 0x0000,
>         .addr =3D 0x000000,
> --
> 2.25.1
>

