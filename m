Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49450AF9F27
	for <lists+nouveau@lfdr.de>; Sat,  5 Jul 2025 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB90910E1E0;
	Sat,  5 Jul 2025 08:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sLgnrflp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750D10E1FD
 for <nouveau@lists.freedesktop.org>; Sat,  5 Jul 2025 08:35:41 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1068824f8f.0
 for <nouveau@lists.freedesktop.org>; Sat, 05 Jul 2025 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751704539; x=1752309339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
 b=sLgnrflpJaIV+1pg7SoEZUBBcSqL1AR1OHPGqjpxF0mN6ekJOe/EdNrtZyMvMYEFG5
 HYZp4qWisYu+YARsL1iaiav9XD7KAe3er8sCfti1oBBakrcQ/34d35L4xrEYtAqBwB7e
 70dQGgtgc8l2z54/RshikLD1SHH0UyjuKvUr94NdjYCotRWHxZDNKyW4c2j5LeTJZ7IF
 kEDQylZspZbqXKf52Dhb5W2WIk7p/KJh7vLIu5ivHE/KJwCINnQMPVjlkVPhRtAwDZVR
 qGVXLsoHRaHOwxuUN4/pRCKHG01SfWDp+s6nYV1z44cYbuKFqN9RYBcTqU4uJj8u9uUb
 5POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751704539; x=1752309339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ah4SIvptMdwSFRwkpjHC9dZIrJE8W7eJFE6nNgvIwz8=;
 b=MYAdcvk5/XTj12Ejpw07Tgqof8dKQMQaNAZmGIenvDD6F4JUzcHocg26gvEd0fjoTQ
 SAl7iFhFLA7D92waPmEhGyZiDIOw4aYGaAyeKPXHFWxd7DJ4paiEQzeG6Jyv5AF6NDTL
 EJMyTZ09frWKOx3BPDPFUYkPG+5RZuYf8Jmvr2qbXjDZzwWrHMAnecaYAjJWP/ARChNa
 HSgCSX6VfOw/e53zkcbxxcijEpM8w/uwAYZP0HbCCl/Z8lh0SlyDThWVqAzHCopihYxI
 cfkTV1K+9Eghw261UrvVPizomV/ao6kE0CrvnYtH2r5HX5boRmzSUz5lcrdwc416kT2Z
 HOMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnh6L+Aq2dHp/M0HsO+RfpAXkAVA+tPJrlOcqZn5qkZ32x+0zbs6YYrU8/5cBbv2MjVGqBRgH0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvV9RHk08U6fR+VY+7FKpofOGPdzBRPfl3YC2n/QByTxUyARY0
 /oz0ZUkJRvzFG8T29Vn3i/Cy8dS3OJZQjnwPeJK2FaW2cUzRrCQnyeEFBvu+VP6AgzmnyYs+bkn
 RCgluXiYw8CDuC0AlENzM155JOnX+gplInU9yfMvc
X-Gm-Gg: ASbGnctJchWfhMbA/eqQ2NtjpBG4ZODyuT62Cnn2swanI5MOS7A+gnGhC7u6qco+YZP
 zgop/FVSvNWFyiepU/4YsprTcO0o8hO5Cf2OiDJ2Lx/Cq0u8JiWBb0O28xtBu3pNm0ygY0pAJ5z
 aH7PBu9jjz7aHUneT4Y89S8Crk2efcDzBYGEu7RfH7JwsIfw6Ic+JV71U=
X-Google-Smtp-Source: AGHT+IH/pkllT3Sy9Cb1lHriZM/tG78khhI42JnRhbPr8kP9tTs+gtmjri5ZYwhkuP07q9yAkZH9HXYofTd095qzzFE=
X-Received: by 2002:adf:e18f:0:b0:3a4:c71a:8119 with SMTP id
 ffacd0b85a97d-3b495cc4ea6mr5351566f8f.25.1751704539369; Sat, 05 Jul 2025
 01:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 5 Jul 2025 10:35:27 +0200
X-Gm-Features: Ac12FXyGVQLpnmxvOqtVG7V_plS_x4VHl-FkqPG4Jcdo-zfXWt7_Lhls-5TlbKw
Message-ID: <CAH5fLgg=4ZqKh1hqFD9bmGJwUf3LK3=K+Q4tTRPnT+NaMubpLQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: str: remove unnecessary qualification
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `core::ffi::*` is in the prelude, which is imported here.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
