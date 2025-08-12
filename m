Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDA8B23A49
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 22:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7A910E493;
	Tue, 12 Aug 2025 20:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="zSeGqx/+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1354610E028
 for <nouveau@lists.freedesktop.org>; Tue, 12 Aug 2025 20:58:00 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-61521cd7be2so8169342a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 12 Aug 2025 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1755032278;
 x=1755637078; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrV4F3ggfLONJKJPHxiw7oTtdul8n2s16wFaeOsH0aA=;
 b=zSeGqx/+KqUpBwS3Ah6+0ZVUjP/v0gxcJNrUbmEjeT+fPOgL3JZx+vZFdT/KUXerHq
 8FHIaZtaUFMAZAM++Dvv+3LkpXBBgc5yAEzKpX3JWICKbzl2MHUzxSaVBH6iHONQlnT/
 QnwWohvJujQcMjzP/fNzESBdvQMku+xvvCyn0UK+640rld/1aIHbYwZYOv6PCzC4NXTd
 e2z3Z96mGZa9T1tJwsw/rI8njkK3Ax7yAApWtjqgizmEcer3/54X2QTyIchw9L9URPya
 W138+1FVYZbeXWIcxw4LDheIazmkl3bEpPuf6vFCmtQTvMCPEo/q2t3tt6R5GgtVkVBi
 rPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755032278; x=1755637078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrV4F3ggfLONJKJPHxiw7oTtdul8n2s16wFaeOsH0aA=;
 b=CRE8xMcWII36EOkAXYmDFsn2HZiM2+BIUReesSW0XSdE00LOHB7e+oMhgQIKlJLoMk
 I65i69RySs0DBVGnvVoqd6DrUVi5f4MNT/A3Uc2ePgOY18U7k6z1v+unoyLQ0QmfsyAv
 GAauN7g5MsAVVrB+N9fldnV+WU5mNTvu2lNN0hCehgbc31xU6TV2f5Upximz6qniXtJI
 xpAxZc6n5Cwza920EmgISN0GbO5L44bW22VmcyHZVEdgjm2HsyRG20NLirfWIcBN55Xr
 Rq6rN2Y2SGsgHw4UO6068wN5PEaGwnCAwTS7PgKBPMLEUvRQmG24GmPYuWHNZGiTbeUr
 jcuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi+kUGzSw1Bthb4PuvY+HfAkGFaYqiEmW3k+dmhfYrKT2mkkW/tbQ+fukx5kh0XXX7KUWUlsn4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3oS0kJVoKD9pXhSR/Ef8G8NhcdNg58ZT5nplIVqBhmDJZ48no
 /Z9kD2dYmFFvZWqHCa2/unvRBqZmVFkW8zybOdgodfTcKio+YPsZTun4INRTpwYSqCOmMKdL4IT
 etwKMIMmoFx207R5uDiC6220pT/juxMyJG68H9zKZjw==
X-Gm-Gg: ASbGncssTskH18PYTNMXdfmJIVyVrGIpop4lpdIhZIUY0RIA22PMKcalTJHZ0hgV/Vk
 GiUb4LeLrp5gCz2ZjymPV2p79sAjC1PZBGoReE3YKrhA8pz7ekvG2jjmLj3P90maPDHLzVmkS6P
 u8na/QPnjdD63gqk8rWsghMDOsS8gvcDFlXahoQSYBl3fK1ybZygf/QL7uL2dwZBO2Zz8y/AGHA
 XMEXCIB
X-Google-Smtp-Source: AGHT+IHXenokGDPc7c+8AH3VQpKGDsLvDZhkCKEmxn5Bfy4MOrgqGlHyzXk2gIBnArM7BAOgBhV3oZF9xry4JlFgUu8=
X-Received: by 2002:a05:6402:5201:b0:618:1835:24ad with SMTP id
 4fb4d7f45d1cf-6186b74ffc5mr259423a12.3.1755032278274; Tue, 12 Aug 2025
 13:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250811213843.4294-1-mhenning@darkrefraction.com>
 <e4d721185bb0e9304f685f99103e63105fb80103.camel@redhat.com>
In-Reply-To: <e4d721185bb0e9304f685f99103e63105fb80103.camel@redhat.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 12 Aug 2025 16:57:32 -0400
X-Gm-Features: Ac12FXxsUM0d30wXYjK2Hx0QCx-YAjMVgZSnrBeTiZQsLkUfMCMOw-lFErNABec
Message-ID: <CAAgWFh0yvFsns=7YuR89R1Bq1SUMGPxq7AT6Mn=R2aaHMAQQyA@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT
 config
To: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, 
 martin.peres@free.fr, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Tue, Aug 12, 2025 at 4:27=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> I assume you need someone to push this for you?

Yes, please.
