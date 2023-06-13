Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC972EE01
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745AE10E3E3;
	Tue, 13 Jun 2023 21:32:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD810E3E3
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LCoIR90K69S2eqNXNzFpren01IJmCK0zgHWdCGFrs8=;
 b=VR8C9+8V5eWWnQ+97AREXMyNAPAB2himDORbpzUrle1xZ7nUeVCe3jpcUUj4KaZtpnY4hT
 pBro8Bu3IBwrg15Gi7JoEcCgafK5szsfFkdFXDoyQoEI8E7wnY5jlQhnknEmJtbnl4hvN2
 lT6V1gMZCdfnajhDProjfc1A2023PEw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-FMXgRznRNO2I1gZfwgvqNg-1; Tue, 13 Jun 2023 17:32:46 -0400
X-MC-Unique: FMXgRznRNO2I1gZfwgvqNg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so8464581fa.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691964; x=1689283964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LCoIR90K69S2eqNXNzFpren01IJmCK0zgHWdCGFrs8=;
 b=kDZyrVQv1acjJQUPc2KObf4Wvb9TmKQ6BdzAe47PErYW3K4jbK8jjsdeoltkrv4IAB
 D0M6qbBnxGqrp7Aeqv9IxKlrLHLyot4mQZVd84QF8fEPuQLxjHO4ykHwHMgEszvR7cpZ
 N4nY36ZK71GsdrHLSzgO/bBR1LA/9z+ck8Bt2Iig9BevqwQd6N0obr4j/xRcNIvKrZux
 cDfWS5c7rRD8V+XCRiYOSPn2hO6s+8suMDtjOegcwJjhLXq4l5P9sUYhQ+9YMQyioFNZ
 bLeTbPwvqfnmhSxNTAFcyo8Qc4Wf7Dq2bvV+Akq7OYchkXutAEqy4ksWidXgFnh10nvm
 5lxw==
X-Gm-Message-State: AC+VfDx2HOpAK0EWlCD4UZ0a/XlnEWlfsS2RU33C0litovn6gOc1kJwy
 Zab9OKvbtpPOaDoL3apKWWvDreR4dIFBweWuIkJcYCrs7iDlw/A8Ej+X/JXojEZ+wlUcZkSiSuT
 wtP0qrJ5OaxOkKkBp0qnYq5Dhr58d5p3/A67xuo3HxA==
X-Received: by 2002:a2e:b629:0:b0:2b1:c077:8d9 with SMTP id
 s9-20020a2eb629000000b002b1c07708d9mr6412594ljn.4.1686691964079; 
 Tue, 13 Jun 2023 14:32:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62SQSQ1FIAesDoH5Tu5TKjiCKecAO7TiTxSdVHvTiyGg5Rq+c0g1i9DE8kHT+V8KpavBaxPVkK7+8FqzaA2QA=
X-Received: by 2002:a2e:b629:0:b0:2b1:c077:8d9 with SMTP id
 s9-20020a2eb629000000b002b1c07708d9mr6412590ljn.4.1686691963686; Tue, 13 Jun
 2023 14:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-6-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-6-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:32:32 +0200
Message-ID: <CACO55ttr+CmteaQzB8rzuvhXKE+AcWwXTTc=sVhWL47DSNs_aw@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 06/10] drm/nouveau/fifo: return ERR_PTR from
 nvkm_runl_new()
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
> Callers expect this - not NULL.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/fifo/runl.c
> index 93d628d7d508..454a481a0aef 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> @@ -399,7 +399,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 a=
ddr, int id_nr)
>         int ret;
>
>         if (!(runl =3D kzalloc(sizeof(*runl), GFP_KERNEL)))
> -               return NULL;
> +               return ERR_PTR(-ENOMEM);
>
>         runl->func =3D fifo->func->runl;
>         runl->fifo =3D fifo;
> @@ -419,7 +419,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 a=
ddr, int id_nr)
>                     (ret =3D nvkm_chid_new(&nvkm_chan_event, subdev, id_n=
r, 0, id_nr, &runl->chid))) {
>                         RUNL_ERROR(runl, "cgid/chid: %d", ret);
>                         nvkm_runl_del(runl);
> -                       return NULL;
> +                       return ERR_PTR(ret);
>                 }
>         } else {
>                 runl->cgid =3D nvkm_chid_ref(fifo->cgid);
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

