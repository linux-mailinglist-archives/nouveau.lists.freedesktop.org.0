Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D897215B
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2024 19:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0AC10E61C;
	Mon,  9 Sep 2024 17:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Iz966UAV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBB310E61C
 for <nouveau@lists.freedesktop.org>; Mon,  9 Sep 2024 17:52:21 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e1a8ae00f5eso4835606276.0
 for <nouveau@lists.freedesktop.org>; Mon, 09 Sep 2024 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725904340; x=1726509140;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewnn+I0cbL5Fc6YtuZyrPYuNwfjqJiKs03aOOqjG7A8=;
 b=Iz966UAVQ+ytGMStst701K5RZ9nILUemzx3sxR0c+6eCoBh6yjFoDtj1R2Zit/h5Xe
 2WLOOiE8CoGW1mAn8k15sizt3Rbbqbbi05VAl+/0avgLzySYykwV+snnaFxxgyOLXvbo
 tTmfSQnWzQEeyRUyVVgzMUlYwmKVskP02VcHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904340; x=1726509140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewnn+I0cbL5Fc6YtuZyrPYuNwfjqJiKs03aOOqjG7A8=;
 b=rFnO+62oSz5xu9XD9NRYY07x9zZREWgqSqKsvF5RZh/mzWRxaEQKkl5MuidjVSMtNn
 RJqEfHqTN9989WUUIh6sZ82o2bTCnzzAqBuzp+uKwCNWL5aHdQq5YShrynuf0wqHOoei
 Ig7mlahshnbcMJmZ/8S0pmQN9iiJBW9sRCzLuiYPFuVI6VodnFKdfrLFnnZB1gRdwhOY
 i0Wpx+OqVUOLXrBTpBx14tCBmIERrBE9Dw32+YwOOSlbtvXyusUoNZdd1a/WKTEXR5Kb
 yteqYpEwkqjppxrirrU8sfx7NedzuBTk8+XiIfMGpG9IR/AxCBnzVKCEuAC1tkrXPW2L
 q5+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKfvXS1YMvG+hTYosDJv7oIHNU6PTEPD6tswu0mJM6kmTjIA1cW2tsYE/hKEzVaIhS/Km+9BtG@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd9YmO5GqBDtx+Gtp0X2xzRJQSvlC2RPfi0+yHGTlTq7AXJSMl
 N35NkhohIl9xEF7dX0Jp3ToB+GhlG8aGn5hyREedxsQOkQ9gfZzOrvAPZxwjuKLw5PHsUcG8Ak/
 gigkLwv7fijo3SqXHvEL+NGoVMA75K+UWRiqt
X-Google-Smtp-Source: AGHT+IHDKPPn8dTPuWieyrmVdOyWupTxM3bjm2KyLBaOg4ntadLH/U0C1Wzi1TrHYhzoSYP/p/zfD2Wna/PMSgFmvmQ=
X-Received: by 2002:a05:6902:1ac1:b0:e13:e674:553c with SMTP id
 3f1490d57ef6-e1d3486ac3emr13335040276.7.1725904339866; Mon, 09 Sep 2024
 10:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240909113633.595465-1-tzimmermann@suse.de>
 <20240909113633.595465-72-tzimmermann@suse.de>
In-Reply-To: <20240909113633.595465-72-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 9 Sep 2024 13:52:09 -0400
Message-ID: <CABQX2QP705HDDUNFCQ0SNkq2-_SaXPGG4KZOw5EhZU68Yu_nZQ@mail.gmail.com>
Subject: Re: [PATCH v4 71/80] drm/vmwgfx: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 9, 2024 at 7:37=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Quick note: I love what you did with drm client and drm fbdev. Thanks
a lot for that work!

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
