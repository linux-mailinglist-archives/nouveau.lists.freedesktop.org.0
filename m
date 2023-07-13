Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB18751CD6
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A2710E651;
	Thu, 13 Jul 2023 09:10:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6E710E651
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4W0yrN0Cztq3pwQ9ywn2rhI9G08X2g+8/njUIA/yh2o=;
 b=Wj6nup3JX11q0LCvc6Hcw8neMbEFWyhGI4J7bcuhmjzVLKvqMb/jnIt2J9ISTi4Mf6Oqp2
 FCMKXuqP6cjH/6R3bybXLj5XViXKYpO0o+LaQ63OJyd8nHZu25/rESwqfPfAHp9Q5wN2QS
 KyzP24uQAI8oCusPwmUgFKMf9oSguLM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-0KVhzo_GM56mfgoLmIY3mw-1; Thu, 13 Jul 2023 05:10:53 -0400
X-MC-Unique: 0KVhzo_GM56mfgoLmIY3mw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso1257991fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239452; x=1689844252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4W0yrN0Cztq3pwQ9ywn2rhI9G08X2g+8/njUIA/yh2o=;
 b=UVL6ngV8J4YlU2G0QEjfpQS1h+BlhTA5ltk4iLsorHSJUm1lSamxTnvAa7m0fTWk+C
 VtFvERQeJtynZCdITe7v/Nz1sJFZWU27HEldxNJhQ1b87YbY43YbiTvYjA483MUBr5Ow
 lCP7feKQSw0Q8ZSk3y59M0QnpfdHZ3/fyYD9AplQidMXYiuaR1fhddQndQJJSa10x0mB
 Z++RhRtVJm5+ZnZU3TWD1bgTZSrHSw08Xe//Ic/yMMdNtqsa2+auq0LWJoWdIu5SDVqb
 nDgOyGfNCwb6WCk1m/Lc0lEM3vM5oH9UmcSflNXU9UxFBtQG4p7jB7u6eDGt4J+Oq1/X
 YALg==
X-Gm-Message-State: ABy/qLZao6Wrw+9VrKEMB5wmpV1aDytJz8Qgv+oa2Hfq+TRiRbOVCDG8
 RlgwbzYlWEhowi2tF++mv8gy7C3fwco2EmkcukA0sCCk/X8NeMGn9zj98XFpRlm8WtjdLsAUvqQ
 fvjV65fDhnIuqs9dcWsfcOEMpXjqvK1xeuxsrDc2c5Q==
X-Received: by 2002:a05:651c:1a29:b0:2b7:3f55:9cb9 with SMTP id
 by41-20020a05651c1a2900b002b73f559cb9mr846829ljb.5.1689239452444; 
 Thu, 13 Jul 2023 02:10:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFTnbNU5Ab6EvMvIcED79oNwfHqmFNcsSHM5EzDOSFj8yh2O3lsaqjAzj2RLA9IWeT11AKCZtA9u/lc82jnsZY=
X-Received: by 2002:a05:651c:1a29:b0:2b7:3f55:9cb9 with SMTP id
 by41-20020a05651c1a2900b002b73f559cb9mr846805ljb.5.1689239452111; Thu, 13 Jul
 2023 02:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230710072012.54076-1-xujianghui@cdjrlc.com>
 <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
In-Reply-To: <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:10:41 +0200
Message-ID: <CACO55ttEnpLTJspqb23RaqNZHms3TM030hZZcFVsBojBskLnDA@mail.gmail.com>
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/pci: ERROR: "foo * bar" should be
 "foo *bar"
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> index 6be87ecffc89..bc51987c5f5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
> @@ -147,7 +147,7 @@ gk104_pcie_set_link_speed(struct nvkm_pci *pci, enum
> nvkm_pcie_speed speed)
>   }
>
>   static int
> -gk104_pcie_init(struct nvkm_pci * pci)
> +gk104_pcie_init(struct nvkm_pci *pci)
>   {
>       enum nvkm_pcie_speed lnkctl_speed, max_speed, cap_speed;
>       struct nvkm_subdev *subdev =3D &pci->subdev;
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

