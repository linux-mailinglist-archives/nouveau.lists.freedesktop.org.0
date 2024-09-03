Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21603969CC0
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B666D10E50E;
	Tue,  3 Sep 2024 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cS1l4VPF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540610E50E
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4TsZm+TdnZyPBPt9XEcOmrkl803e/sGwP4m6WhmvEE=;
 b=cS1l4VPF9MLg7WL4DgUseJQe79Nwb21xmf4sK8LHdoGVw2jADWRYR1FZMUmDiMZrY9vhc7
 acgpRK76kTsk/JjP/koabJveyvmxPuxUFYJk8br+li4m0OPR2s3enF5y1iWGXAKzCU6miy
 9tSSpcHCGGZ3nTlhmUGiE4reKfRoLqU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-yY78qNLPPvmRCEOBYc_aJg-1; Tue, 03 Sep 2024 08:02:31 -0400
X-MC-Unique: yY78qNLPPvmRCEOBYc_aJg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5334844dcc5so5249437e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364950; x=1725969750;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4TsZm+TdnZyPBPt9XEcOmrkl803e/sGwP4m6WhmvEE=;
 b=erpqQTpjXWzI6/gitiZBlwCkfTEP4ukmhBOc8c7EMizKWx6Bq9uP80BAOW0vKjLoZL
 ow/iAxbEAk1P4G02QsXZorqvag44K65sedkLtDRlOAXukcNUao/Mux7K+B+TdIMPLnrr
 LOjBQpSvHboO5SoyANn+7Vn/5dTdVsPmYalF4HH9OC40axmw8hwPPVpPyU9Sy0kuk89r
 9QI9KPEMNvhb6XPFfBQAAfOooGgmArEAadeP2t2lXYuV1srykf3HQIJnQ9efot1bGLGD
 bvszDRpx/P08Sj/WtDeIOPxAoajF9UR0MRFYrqkSeemrANxTQ5jcyGyTparErH1Gc9vf
 d8kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLcpZHERUHryEFSCRvtWunSlXJP87IhHraCSbuSWaebogOOxBnSA6/ykKy5LRmIgUzceFVaky1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwThqgy+7aF0mQMS+5zSEufPdxyKVqkP+zkuqlG03JApIWQT5i2
 GF9DazPsGDlnLS/7ajiIwTx41x2SZ4PvVBrzX53Tp+emJWhoCX3Qt27uvGRCSZga2QYtSzkpZaK
 OsvvUnwiVmgKDMrQEqLOpOD8irqa3xeb+tALFah85778uNUcII5CVuVGFWhoFK0M=
X-Received: by 2002:a05:6512:131d:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-53546ba05f2mr9159115e87.38.1725364949858; 
 Tue, 03 Sep 2024 05:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/shjDInDkDXnEy4T2771RVaRDvCaaUkAiQqHS5oLr5ZbCmo5yfav5ha5LT86E5fjnj1wp2Q==
X-Received: by 2002:a05:6512:131d:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-53546ba05f2mr9159078e87.38.1725364949298; 
 Tue, 03 Sep 2024 05:02:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbe79f545sm136719155e9.2.2024.09.03.05.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:02:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: Re: [PATCH v3 62/81] drm/vkms: Run DRM default client setup
In-Reply-To: <20240830084456.77630-63-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-63-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:02:28 +0200
Message-ID: <877cbtdjxn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: "Ma=C3=ADra Canal" <mairacanal@riseup.net>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

