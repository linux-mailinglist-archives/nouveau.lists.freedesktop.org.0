Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996F72EDDF
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6C10E3E3;
	Tue, 13 Jun 2023 21:27:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FA710E3E3
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lmINVIFKlrfXJFMttn71Ue8qA+Ux6QnIsQN/RqEYps=;
 b=fgLs3znUtovQOCTXIm3ZWusAasy19iblyopi2DfuoezANqdGdWYW13bOZjzwi+pZ3oBzGm
 F2hlcRJ6Ys5w3uCcm3r7HoGRDlwNwtTZVzTzwV6QKcuIHBc3inrecKw8gh/sNHDQQxtjIT
 7dtJlTsWUf4Es7CuKUXEWPZvyFEB4og=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-pPdgv_uzPyq2BZMdhQfSew-1; Tue, 13 Jun 2023 17:27:11 -0400
X-MC-Unique: pPdgv_uzPyq2BZMdhQfSew-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4f74128e499so451242e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691628; x=1689283628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lmINVIFKlrfXJFMttn71Ue8qA+Ux6QnIsQN/RqEYps=;
 b=B1h3QBjJXSBnoCVpSZoAVv8ekhri335DFa4uMcRDYPQp/naarDOVQX4rscyx+DhQii
 /NX4VF/3F7PNmSZTwxI6CJ+0n+ViA0gjmYYdYb45+Y/bO87ix4VWochJY5YPNsmIQXwj
 7DZQL2xkEolBlDqjeW9DCUt2y1t25h7cvCpjaOTFQFEWI0ksEyZ1/jvQ8GXCdN6M8IKJ
 AXegNmR/I/InRPFGsZ1wq2iHW8ign7O16V/vaqeMoiJ1c4qc8EqEtYhMQeq9TNIOhvwi
 pAt4HNZEnkALq0R+hwbduk0V0mCZ8+ByZIWioyZnvcErytT5Y117qJdAkwj1a8tAZsaN
 1+AA==
X-Gm-Message-State: AC+VfDxojfIwQ7re+nhy4NR7DePb6ZmpyRKzgvQpaqqGfWauC9q50ofg
 vzkgDAPEoD/m4BX5g+g2zOFodz0lSmUfvNK4xL78eSqeQPvvgZAgXWOggKwNQ8dNyArfxBJgq+u
 xAb1+JCBZ3Umagv5ZhRAeE9wET4TPVd6Rp6S5Ydn5gO85grji4EdP
X-Received: by 2002:a05:651c:2ce:b0:2b2:1089:dcc8 with SMTP id
 f14-20020a05651c02ce00b002b21089dcc8mr6640974ljo.2.1686691628100; 
 Tue, 13 Jun 2023 14:27:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6e9Q7BG4okOCQFIoSNSUjSX0lDvozxeJLSB3JZBl7xHKDBC46BuR+8VkF0Pr9rNzeWEy1iSpKiABON6sZd8FA=
X-Received: by 2002:a05:651c:2ce:b0:2b2:1089:dcc8 with SMTP id
 f14-20020a05651c02ce00b002b21089dcc8mr6640970ljo.2.1686691627828; Tue, 13 Jun
 2023 14:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-2-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-2-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:26:56 +0200
Message-ID: <CACO55tuQTkKdUr-x-GfSKBegUsVHtUqW_sU-Q3YQAhD=5_bxEw@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 02/10] drm/nouveau/nvkm: punt spurious irq
 messages to debug level
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
> This can be completely normal in some situations (ie. non-stall intrs
> when nothing is waiting on them).
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/intr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/intr.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/intr.c
> index e20b7ca218c3..36a747f0039e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/intr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/intr.c
> @@ -212,8 +212,8 @@ nvkm_intr(int irq, void *arg)
>                 list_for_each_entry(intr, &device->intr.intr, head) {
>                         for (leaf =3D 0; leaf < intr->leaves; leaf++) {
>                                 if (intr->stat[leaf]) {
> -                                       nvkm_warn(intr->subdev, "intr%d: =
%08x\n",
> -                                                 leaf, intr->stat[leaf])=
;
> +                                       nvkm_debug(intr->subdev, "intr%d:=
 %08x\n",
> +                                                  leaf, intr->stat[leaf]=
);
>                                         nvkm_intr_block_locked(intr, leaf=
, intr->stat[leaf]);
>                                 }
>                         }
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

