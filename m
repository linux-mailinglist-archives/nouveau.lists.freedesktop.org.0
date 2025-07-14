Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D8EB044F8
	for <lists+nouveau@lfdr.de>; Mon, 14 Jul 2025 18:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34410E093;
	Mon, 14 Jul 2025 16:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0Busqj+r";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EC310E055
 for <nouveau@lists.freedesktop.org>; Mon, 14 Jul 2025 16:04:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so7511318a12.3
 for <nouveau@lists.freedesktop.org>; Mon, 14 Jul 2025 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1752509069;
 x=1753113869; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqXm/T0vczF/8wwedbnGXW3hQmadLRteatm7i2xnx2o=;
 b=0Busqj+rnoQmPv+fk4IXJMD3Rsh0MaavvekD3e1zY7f2MO5mgZ6TQ4aWCiUXI1zhkQ
 A4koF0E+c8AJK7nr4LeQMCRZLUVF5UY0S5wg+OpoUhqAslS+Y0xpkfqz0jH8hRAJIQ6q
 rCKHqlDFTpz3eJl0flTSTfvIPYNODJNPhEOuO4CgQv7Y2fuF4ocT1p9agp3epZReI0V3
 /YQSPvkt0kcV0Tl7KHIHW0npBhtkNzbG6CXp6cyydHxJ+q6TuGATJoZit1BvjxBWZpFn
 20sNVi3IFhiU9aG2PNeKOVi2ZlavuM+GEZZ1IVCw+xzcE6/dE0aOXF1BHQleYXxb7fmD
 roAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752509069; x=1753113869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqXm/T0vczF/8wwedbnGXW3hQmadLRteatm7i2xnx2o=;
 b=E3Ah3jeLZ2C68drz/h5UgYHQ1Hb2jaGw9xrXZEdgJh4EFdwhiEx6wdhh0Fp15p1gyM
 ZRrKTp+txRwTs7PoF0wwZND4lnZfR5dQ9eBSXmcQYmRj5v+5VZ1bNPHdb2M2qgZXuNhX
 sWXJaL8VG7VCeFLVSTOOL2TAf/IoLzMMi06ZoKbwgBHaiM6UxJ3MafrIcvEXxgJJZhpN
 UBDUo0WFx2VzyykOivDYbxDrhUdm0FFrxzoFdsUmS5rUDdxf8jqaXay9CfXhL4UAc66n
 ssChq89nBPzlZvtA15dIZUdZiyYM1vsztIHreOjtXwgTAgiauAVnOneQ+W7lUTcttTab
 Rnjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJJwWkQme2zLAJpPSyUfndCyDsukF8rdn8W1PQcQ0fM5/bNWpxr9VkwDnFVJ599xn9q8F+lcI1@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8QCfYiAIbNi9dkajy2260gGtMl+Cf+Kt4Vv8giBcCX0gE+PVC
 DI5MuBBD1QNMZV0lvdfcKuQCcCf85sI4fb7ucTdHxmDFmnp9rb7eDYRiaQDy7YHTCBEd2D7+9Q7
 /sw1S8iBumf3l3mjURQz2ABZmvPZDLauJhK9THGWu8w==
X-Gm-Gg: ASbGncsGnYz2SeLMu2/GvEC4Bb9X5SoXTBqiMrRGQMEqms0rIueT6pqRrsqj7Y9QxSd
 s05X8e02qVjH3e0BhpNVlGMuiG+Uy8I8ENt6cnb+ZByIo++JAZlubNM/47uWXVOXeH8POGmlPBL
 zyTo3D9lb60u0hTVsmKIRJmh3oVmmRdkrHultRwHaxlHs3ywGIGGqTBbuNIY0pSe2Q32a5jNS1c
 jJrvFDOnIKPkKd9c50=
X-Google-Smtp-Source: AGHT+IEa9/U8ZoI5SDlaH2Qpt+vmCSoSI5qreRFwcJbAXp/1OEwu7K55Iz/uHKxKmngvp65qOqd3vx9FoH0G4HY1bJw=
X-Received: by 2002:a17:907:9811:b0:ad5:2328:e39b with SMTP id
 a640c23a62f3a-ae6fbf20e29mr1465673366b.31.1752509068346; Mon, 14 Jul 2025
 09:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
 <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
 <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
In-Reply-To: <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 14 Jul 2025 12:04:02 -0400
X-Gm-Features: Ac12FXzcvAj5jkGMjkyBym67HuBrbs9ZybatNox9USZXyOeycmxfaXT6qmdGEVM
Message-ID: <CAAgWFh1N1_j+jXpMm+fcC9tPTs99QKACb8Ox7mph=UWx28zVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "kherbst@redhat.com" <kherbst@redhat.com>, 
 "martin.peres@free.fr" <martin.peres@free.fr>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>
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

On Sun, Jul 13, 2025 at 11:19=E2=80=AFPM Ben Skeggs <bskeggs@nvidia.com> wr=
ote:
> Yeah, the GPUs that don't support GSP-RM can't hit the code that used
> fwif.enable anyway, so the series should be fine as it is.

We're actually talking about the reverse case. That is, on Ada what
happens if you set nouveau.config=3DNvGspRm=3D0 on the kernel command
line?
