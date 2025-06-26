Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D745AEA440
	for <lists+nouveau@lfdr.de>; Thu, 26 Jun 2025 19:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DE110E2BB;
	Thu, 26 Jun 2025 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="g3+VYalZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48010E2BB
 for <nouveau@lists.freedesktop.org>; Thu, 26 Jun 2025 17:15:48 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so2261481a12.3
 for <nouveau@lists.freedesktop.org>; Thu, 26 Jun 2025 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750958146;
 x=1751562946; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLfECuoQMvCucla3U1r6BxHigyx1+JYThDNzS9jd4eQ=;
 b=g3+VYalZqk5vzGIDiLjy5OnaWTOrsAJlc8fXTyg+gQyqlZdu4J3ysCqchCgm8nW479
 8Hfmu/tcTH3RV5WxM/1S0ek0G1Oth1gqAoVUEGd3eZX2UOWubZgkVOgxPu5sTueYVXsa
 QH3DSupeI8KkJEs6ZA2OZEyt3Nzsr7Qxt8QvuRoWmk26Ed/Z07+Vu3b6n1+F7UcEwQU0
 I1jRMI4B+p35DdzxIuXN2Y2Gky0Z/kQ1VlYRm583rXkxnUVtjMUE5o21g/tklyBxmVcN
 5/rte5G8fTecS/pCzrDybnXze5yyRb5b2DBGwOD5LYGkxst8PzXgC/K0xzKUHTP/bQuM
 GZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750958146; x=1751562946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLfECuoQMvCucla3U1r6BxHigyx1+JYThDNzS9jd4eQ=;
 b=L2YIWIO+Gn4hcFbMxF+1wlpH2cJCVP4NHXKPqayPbkziILajOQDOs+17sgtgnyjvbt
 EifgjjESs9p4/NpxfEhWpfDiYKEkwoyWkIINzECtKUp3jTiZTPnQXeHUHHQrr0r7tglT
 MK0uxR+1oOzbNsX50pXVUQ8/oIvfeUU++4Si7P+Rhs5/96pdFMsNUml01sADrNSW4NYg
 QvM7b7jz4dNErfvx1OxMYOmfPLGL66nahC37Ws/dEWQHJ3xYPDbJjRs8FXPVC7u5ABoh
 qyM8cpoVYbogPaubb28q9tK0kX6sU9/za2gZOXp9hrg0P4S8hpZFrHcnvA1wa96E89ly
 xCOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCt6imAc893i5g2resdvpq9qjjNfMiiCEW/SOVeRivWzhmRoq46dGtGGxKVtlvVpTQbNJyo4MU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJtbwUM+FolDkW02gO9xXFodfApbj5QvFsVKfaFZiO+LnRG/Fz
 m2jG5uon2TNZLEqdJDReo7AWjXOfRzhSJqGXBy7BOx2zOxqv+91HCcCsmLB3eC3gyfzkCXakusp
 MgQhRMD9kKL2xCklQPiSjAhqz+sH4n3jJtw2meuI1kw==
X-Gm-Gg: ASbGnct7uzEuNq2nVIJEtOyhzNv7KGZTAbw983hk8OSXcjribWI65APapyN6WvKZY7r
 769CPdgMdzfjfK6S81OHSHCpYvkIRMEYCMydrsww+XmQPzk2C4xH9JfYU7xcW2J+qDvFgkmUZq9
 qFT77HJxzJeEEHNq/YiwEK31eJVj87+d4NEA440LCM3w==
X-Google-Smtp-Source: AGHT+IGVNUkUCO0nah2E3WODdUj5zdLVLo1Sh/MdDqZ7TtgD3xcSUxlLdntTQWNRNqZlDdb3DykRhw851y+PW6YdKUM=
X-Received: by 2002:a05:6402:13ca:b0:608:176f:9b5c with SMTP id
 4fb4d7f45d1cf-60c66992674mr4246427a12.20.1750958145370; Thu, 26 Jun 2025
 10:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
In-Reply-To: <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 26 Jun 2025 13:15:17 -0400
X-Gm-Features: Ac12FXw88kvHArfNZhyMBY-_xqtKscFpUyd2DhdR2y-j-0Cyv-ChhaFAQ7MagNs
Message-ID: <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: Timur Tabi <ttabi@nvidia.com>
Cc: "kherbst@redhat.com" <kherbst@redhat.com>,
 "martin.peres@free.fr" <martin.peres@free.fr>, 
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
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

On Tue, Jun 24, 2025 at 3:13=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
> You have a good point, but I think your change, in effect, necessitates m=
y request.  Previously, the
> default was no GSP-RM unless needed.  Now it's yes GSP-RM, and the concep=
t of "need" has been
> removed.  So there's no indication any more that some GPUs need GSP-RM an=
d some do not.
>
> So to address that, I think it makes sense to add a warning if someone tr=
ies disable GSP-RM on a GPU
> that is not supported in that configuration.
>
> Now, whether or not we should ignore NvGspRm=3D0 on Ada+ is up for debate=
.  If I understand the code
> correctly, today (and still with your patches), Ada+ would fail to boot. =
 I can't say whether or not
> that's a good idea.  But I think a warning should be printed either way.

This patch behaves exactly the same as DRM_NOUVEAU_GSP_DEFAULT=3Dy
kernels already behave.

That being said, I'm not against the additional error checking here
and can add it to the next version of this series.
