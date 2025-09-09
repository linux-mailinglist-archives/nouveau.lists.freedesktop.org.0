Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7ACBAF4C
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCA010EC8A;
	Sat, 13 Dec 2025 12:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oto3PJdW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5664710E081
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 07:21:36 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b4fb8d5dad0so451574a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 09 Sep 2025 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757402496; x=1758007296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9DtedJsOYuVEvTUaq8Uosius3V8uLRiTM1xhY019yI=;
 b=Oto3PJdWL3bDm+T4vCO7hPnWP3A5dQpez37ppj7ZISyvYEBqVwyb7Up9hTAapG7776
 i9XnkxSHmVeGN7dVUzygddOiTmQrfummG38aubRP4AufjSqgryLQTp4twEyLIeWr0jgU
 sdbNDb8lfGwJGDaU8piNXGHCrdpAUVgT5ob5xjWj5HAFG7hq8LE1cSu2FtSWj6Pd7b9L
 G5wd86hyUkte1h9vBBKhcOUlwJRwQm6zftwxAAgoMqHUyo2rFRRV2A7wdGkFMkyVeYuX
 vK7EEHSTFWgqYSOaVTykulcIdDQa26EyaeJ4zGh/h06uwl5zyT3KEmpYuYrl5vOQpPou
 HV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757402496; x=1758007296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9DtedJsOYuVEvTUaq8Uosius3V8uLRiTM1xhY019yI=;
 b=dF46j2bzOWHzBfRlPJKLDjY94n+KK9m5vvbU5/29wp5ITlApRO2tDJk4X7mJx/avlc
 OX4cZ+ddgvYcdWIHw++gAPLxFJ+ZIJ0E3P5KDL9xd169hESiQbMcRyDqAm1LN/eZtusP
 ncN8AID47uAWezKeE1g9vkoKE0Hb2tHGrfKNWhl9JtLwHBOkfG0IDZmZFS0JQGwtKBGZ
 lFkMruA+PMd1DgSLNeX0NnGbG29QtO7/DrTvBzDzJhhtcuHKn6YsVSSgPPQXh/oDMQFb
 aCrihpf7gn1uUhj8Ok8a2iXOCWwbqhsPb5O4Qtn5B7JTkkHyaNms4pFsdffeICmzbOEe
 3MTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2cmSd0u3BPioEPBq47OYIXQYk7Akk+HFh+BgWU3HEElCQ1jg8oZfnHsoUrIFxVb6F/11wp48o@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywc3twYe5jCRUjN7/LOmOXDjAykU0dHrJBnOoEnnsmNjFXrsA3o
 h3T8dhj0YK1qgN3uHrj2rtewuMqNss6Xebt9NLVig9G/CND9YLdg9KspaGRLRw432R3EF8xg8xj
 ggFT+V4n97HL1VOuLh7dNb+1ddlFpC+g=
X-Gm-Gg: ASbGncuzLgKHdg5hojqneKndjlCiYYk58Mw0+77PQe6RCyGH7Yv0xmFhYPjpshubvuY
 nwp+Mq17BQqcj0U2x+LxWVr7S5mjnL2zdgyx0NMTqpvf2B9BfES+DQXWn7Y9/8d2iPl4E/Eni94
 fbt7ovErBrQTz7ZcRKQpHu46densXiqcvietYcbt6RVJJKPmg1kKfwjKLOOR0A3p6IzpI11m2qm
 u5rmlR8q3xxoMEk2xxoHsIhO0H5179gQX7pxCvx8k1VXmnyCY1ldgxn8UzNWc79sMG8s40xsA6M
 M/nEN6YPM+EQ416Z4QGi4ISQKA==
X-Google-Smtp-Source: AGHT+IEIXETZN1hzIMbaPZTBAMFbsBjP+gyiUTRbHUQasXE8TDSwxmd/yWLYzZKSkpfL8EimpWar9GL+cCL5u2GOr5A=
X-Received: by 2002:a17:90b:4d0d:b0:32a:e70a:fe88 with SMTP id
 98e67ed59e1d1-32d440c4cf9mr7541621a91.7.1757402495698; Tue, 09 Sep 2025
 00:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
 <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
 <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
In-Reply-To: <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 09:21:23 +0200
X-Gm-Features: AS18NWDo9PmPkwt5HhFhUFBw5hG52sGUJOa3FDCEs24d7ACJy4H42N2u2Jnvv7M
Message-ID: <CANiq72khp7PVeKmbvM=ima7Tp7o1zPfjNY6dRK79aAQZsOvBPw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Tue, Sep 9, 2025 at 9:05=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> With -rc6 approaching, I don't think we will merge any Nova code taking
> advantage of this for this cycle, so please feel free to take this
> patch. We can then merge patch 2 through drm-rust after -rc1 is
> released.

Sure, sounds good. I can also take patch 2 already as a user of this
if you prefer (ideally with an Acked-by).

> Should I send a new revision with your fixes, or will you apply them?

I can, no worries, thanks!

Cheers,
Miguel
