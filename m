Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CF72EE48
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBB710E3E0;
	Tue, 13 Jun 2023 21:52:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6D010E3E0
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686693157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZvhYduJe2rlbae+VTRbXLHYnMb8OahS4w5nSLA/Uwo=;
 b=GsdOLAOrqxsQNG4sulvhjk7GwLC1SH3wKUP/5KEpZvwHFCVYJF07BbxjPPVgsk3zq308to
 cxv3zbZ+vQsWZ9Jm/Yda9PsmR0GIRQohBCQYfE4qpLCGTj6nmHAGRdnMq4kapdX2gTCoA9
 owaKP2imQPPeMLto3oXdmlnLh7N812Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-3PjQr_2XOB-mb73nwgkRAA-1; Tue, 13 Jun 2023 17:52:36 -0400
X-MC-Unique: 3PjQr_2XOB-mb73nwgkRAA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-621257e86daso17862976d6.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686693155; x=1689285155;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GMYfzgM+ztM/BXP2g3ShGsmyXjpV1AEyeop7YH2x3+M=;
 b=bUn5qXyrgZvSTkHr0aT7RmTCu9w6Z4ka2M3pEX/Ytm8H657DSBkG1fZFvyVD/VQXnI
 5JmsYMXPonkej6FdnyivKfaoBZptGmg+e2q30PEA4sR3k/aH8GzavYAlLJ+FRkE+WcUf
 33NR44RX8ZooUPRz2Xl2hlNqrg+Z8f9CgpnDcVRHWRDxsT2UfJdhj13OZA2Utqcwc1EO
 l6uuBWsNF5hS4m7J/Hw2N47TTUK4eTWe2x364ldIr9n4li55XgvEBV9J/kV2863d+o0o
 om4NzIjV1mYyhtpZUSMbNImXifo21ZWHR2fPFoB58oVM4B+jPnbIhprRbnZZo4/JlxNF
 WxfQ==
X-Gm-Message-State: AC+VfDxEO51KXXLaWSt2P57899BTNqGNTiWTW/7Qx/sCtEqaoMoxFRF1
 5+Ji16tBdoduyPX9+HLMImfEz3pjYdNZNBynNb2ssBpijD0ANbJu5oDus5dt1zrs5odwMJhDamz
 BXjBxzbJSMIBTuKaQMgZvQdMfQ2l/FkPL3A==
X-Received: by 2002:ad4:5c87:0:b0:62d:f8e7:304e with SMTP id
 o7-20020ad45c87000000b0062df8e7304emr4005976qvh.44.1686693155564; 
 Tue, 13 Jun 2023 14:52:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ476rGf5artQkHsj04Yg17p5iozVv767ULk9rW7L9K2sjpyBFNHOu0bfZ/TG5Y8cWLibyhIbQ==
X-Received: by 2002:ad4:5c87:0:b0:62d:f8e7:304e with SMTP id
 o7-20020ad45c87000000b0062df8e7304emr4005955qvh.44.1686693155330; 
 Tue, 13 Jun 2023 14:52:35 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 p8-20020ad451c8000000b00626161ea7a3sm4246643qvq.2.2023.06.13.14.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 14:52:34 -0700 (PDT)
Message-ID: <3b55ca96640f18c7513b7e2d443e15ffeb67db1e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
Date: Tue, 13 Jun 2023 17:52:33 -0400
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-05-25 at 10:30 +1000, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
>=20
> Turns out, we're currently tearing down the disp core channel *before*
> the satellite channels (wndw, etc) during suspend.
>=20
> This makes RM return NV_ERR_NOT_SUPPORTED on attempting to reallocate
> the core channel on resume for some reason, but we probably shouldn't
> be doing it on HW either.
>=20
> Tear down children in the reverse of allocation order instead.
>=20
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm=
/nouveau/nvkm/core/object.c
> index 301a5e5b5f7f..7c554c14e884 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> @@ -185,7 +185,7 @@ nvkm_object_fini(struct nvkm_object *object, bool sus=
pend)
> =20
>  =09nvif_debug(object, "%s children...\n", action);
>  =09time =3D ktime_to_us(ktime_get());
> -=09list_for_each_entry(child, &object->tree, head) {
> +=09list_for_each_entry_reverse(child, &object->tree, head) {
>  =09=09ret =3D nvkm_object_fini(child, suspend);
>  =09=09if (ret && suspend)
>  =09=09=09goto fail_child;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

