Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4376DC48302
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 18:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1FC10E443;
	Mon, 10 Nov 2025 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=mary.zone header.i=@mary.zone header.b="burPOSjm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779810E858
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 21:39:52 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7815092cd0bso716277b3.2
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1761169191; x=1761773991; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY/fVzl28BJXNG49hJlcZcehSDNURMQ7FS8BdFDQScQ=;
 b=burPOSjm6sv+2rTFzfgP48VuAYtJ9Dkmd4jhLdfMD0u6BZWV0IGde08xtqFi3xuCln
 EsK1W0l1XWah50nk+Cx2SDba262Cd/5mRmAzi7SlECS5U4o2aDTCsC4/azJa3bcdIbnQ
 0zGGG2uVGtqT1Q7Ov6eS/DxvZ1iVww5yY6laOw0rRxodCPXx/fhqNvCs/42iSifpxEDn
 bihUBP5kTrxzrHukxDKq63LeKs4bd18X3K6iS0xZ9F6w8hp9hnB7t2n1cpVKxg+3kfOX
 oSLbTwxNm2q9sWEWg2TA4Ms79dYNfnOYXtb9UO7BCT0H3Fk678HrNC4oH/CVlesAaJRf
 FILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761169191; x=1761773991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XY/fVzl28BJXNG49hJlcZcehSDNURMQ7FS8BdFDQScQ=;
 b=c6psZlY4fTViTl1yZXRj9tc7VxZ6ItChJ/E9MovugCUpM3UWQmZwLyESZVqhicE8Ms
 HQWQrxYm7wUjYL5XX05BJw0D4J260wzWiBcfUNydFE3bfaxSI+vTsiUkKCB8U22iWQqq
 empyQa06Sg6rSQLNflf8IaEAUzIuRdD4+z35wcHbslR4QXzX7NLdZaP8Agm+fDYMAgkB
 9EBpACqGMDhKLrOb9o936F+O4w2lj/vFnFuOeXh1ew8nKNGeV1cprShRkol+D2eyqBot
 IYAyTPykcSeHDZaLzEhrCi008wbKS5sxwkn+Rv4GyGEUax/g9mIi5Nfv2+ij/pFy8tu3
 QgZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZc3Weu3MKHWM8nz16HUIlnVWUOV1791b6qoqtxblquriBnJr4M8q0LcdAVe+d0GECD3/7D4t@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylhb58XkstMaL4b6ADZs7cFCJ1CSWl1srMb03W7kKqZetUJTwe
 s9MU/FTREMjZrmN0oi2NGs3NUv7wp96NhLcDm/y8v44D0qtF6WVleFqiVH0KzmZav7ib5Keqlj7
 4CGI4hVTCMKLESrFNrv7KGezcUnDUJONXHLmcyutcrA==
X-Gm-Gg: ASbGnctx9bIpsTOm5TMdUZaQ03Fm1NePwP2XE+RSWPFlYhrkhVcuw5kseCXprl6Ft5y
 4yaW6NVofwZOejxObh4zxVP8TXcenntZU2+q9QG0OGYu9Jm2zbgwvSeSaN4Fh4xA6OeDiwASYCS
 LqWRo0BSYUsXIOQqTNOecaxdtByu+XVW+5TgQlCf2QiMwgEAABn7I62czQyKCeDIosHTAWjoGm2
 ehzzmBXYPQV8P7kbA9yAfaMi04NFQXdd8q+MaK1Usm9JQSOtOsZxhyXTCBwWDXnRlZkIghkkG0Y
 ixNqVvkqgFRH6brIIuqfpdLvIONG
X-Google-Smtp-Source: AGHT+IHLticEoUHzz+5YlBnUoC99gaUTyPszn1BD+u/JBN5hlfiJhQmAcF37pUbO0+8+V7Ij2JZoZtpIzB/MD40J78o=
X-Received: by 2002:a05:690c:25c6:b0:780:fdbb:5265 with SMTP id
 00721157ae682-7836d1c62b1mr345947707b3.19.1761169191371; Wed, 22 Oct 2025
 14:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
 <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
 <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
 <904ba70f-b1bf-4745-8e92-d27a6c903673@kernel.org>
In-Reply-To: <904ba70f-b1bf-4745-8e92-d27a6c903673@kernel.org>
From: Mary Guillemard <mary@mary.zone>
Date: Wed, 22 Oct 2025 23:39:40 +0200
X-Gm-Features: AS18NWBm422X6XetKOPBkLZPJQB9QiYJm8O_YbBTYHKPk9yZbZPBR3qyH8LezJU
Message-ID: <CAPv6GL2DQ_wY=r4eV_V=nBGaj20HtYzRfJg==rQJtuO8Fo+HAg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 10 Nov 2025 17:05:26 +0000
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

On Wed, Oct 22, 2025 at 10:56=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 10/22/25 12:16 PM, Mohamed Ahmed wrote:
> > Pinging again re: review and also was asking if we can revert the
> > select_page_shift() handling back to v1 behavior with a fall-back
> > path, as it looks like there are some cases where
> > nouveau_bo_fixup_align() isn't enough;
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450#note_31=
59199.
>
> I don't think we should add a fallback for something that is expected to =
be
> sufficient.
>
> Instead we should figure out in which exact case the WARN_ON() was hit an=
d why.

The reason I wrote this code initially was to handle addresses
provided by userspace that aren't aligned to the page size selected
during BO creation.
This is something I did trigger when typing this patch initially with
my distro provided version of mesa (likely 25.0.x but it has been a
while)
Thomas Andersen also confirmed on nouveau irc channel that he did hit
this case with an old version of NVK and this patchset.

I think we could just remove the WARN_ON and properly document that
this was previously allowed and is there for backward compatibility.

Regards,
Mary Guillemard
