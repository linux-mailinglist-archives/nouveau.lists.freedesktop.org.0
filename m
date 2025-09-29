Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B659DCBAD76
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3580710EB0F;
	Sat, 13 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUVEpjwx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61110E450
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 15:26:58 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b55197907d1so3623268a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759159618; x=1759764418; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
 b=BUVEpjwxJcwkzyVRIy+wrHu7MU1SRyMrxaBRwnzrmB2NBdxMBeSBwCUh0afthjMvrN
 AUM4RtiKNCNde+w5+gByLzsyNA1NwfVukbbpMasMTqkYndjfJ3sS03mn3p3WKFT5FF86
 qRBbZ2TZNSMW2SxFEubnJTUoDzXL+rqn0GQYavtRWHzatizpWLfaP71HaJJUbNyxgCGW
 Lv4/4BGkFrJrAeNc1bcz2m8YOg4uY4AJRR/EufV0anPNaHDsunLC8+t5ctgEKjc0LTAd
 EX3SK++AiX6elxQWQ+FPzhVA1UqBFuAdXzbx539ySJK/UtnxWJTXjEQhjnS33eGxjy5p
 WYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759159618; x=1759764418;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
 b=CEq3X3cDtcVKOOduHrMIWIxW1Lt5PXAHeUt4mkkuE1ZkTEnEvRQGxFI92mlHWS6MyM
 2H1O6n2JvgWTrvVWHFfqhPJQi0fQ1Zh7islgCH4JCrgi8jdKjZz0uHYIvi8AL3qGwpCc
 qojLNVo2yv8HfRjvZ6t0shy+QqwBfRkt8k4m79JGNMAMmd0aPW9hL/37ZlcpAH5qjkLQ
 01v4wZE0kDtEtkcCZWrdOXao/HRNgmT8KLllkM/B+Vuw6q5ebEkX1zBvlD3j1O8wb9KM
 8GSn6fgNQTeU/3s0NLxuu9ZC7RV2b58XIYfT7GL+TD8XGAQjWSYDw1DfLL/8iTbEjnm4
 +6lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7hyJRIeXel/Spm0M1svihzqscOa/pOGNdCtcn5pvgojULku9KZZtcq17IHU7vaXTc9W2DKYXC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvQgqr6jSBDp00Q1pq7wU09xOt4TE/PoNYUh/WG6+84JwYhWDE
 tHUPml/l2CWDpAJo0qIP1xd+ssW0Wnhc0++GkZHevHHXxVy/+dflj1TZ
X-Gm-Gg: ASbGncvzNyXyK9yIJ60jmHgjKNFh5x14Co1lj/kEA0de5k2qUCQ5iGW6M0hBkSMsw1H
 de5NXFrwVN0Jgqc2mQXhmjqFs0tiJfE5d4NBqfz1jKgBChUWZ3rojdIJ9BwYL0LgVHD559hf1gX
 KKCXtO7AxSO1TECP9fBhGk4LX/pTYmeIAioeiUyndcQuOn3sh2nMRbWi2j6K/dfpZWnGtmm03Tf
 H35WE7DQJpRBOj8CBNilXTNWf+nu6WeBsZNY7eKeLvPfxgWFhpRHdOZIH5KZAC6Yh3WtgY4WsRQ
 8I0kXeFZhZj6eXQyqiYNnOarKz5wQT6vcrQe41/bdYTGy8waVYZ9l820nQtCci2tPK/kxT2OFQR
 p5xtfrQFCBEXBqHYDg+VzEICNYD7Q1wTZdU4f9uXpDmE=
X-Google-Smtp-Source: AGHT+IGlrXcMqMEE95Bpk6Fvp2Z3JkSBS53/nlBPtQ4p3saTyAp/aYHA69EYxK3FJ+53fX34h/VJMw==
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id
 d9443c01a7336-27ed4aab57bmr188196505ad.38.1759159618299; 
 Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d37casm134991565ad.8.2025.09.29.08.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:26:57 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:26:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <aNqlPzZn9jUjSKfE@yury>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

On Mon, Sep 29, 2025 at 03:59:32PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 20, 2025 at 8:23 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > The bitfield macro's setter currently uses the From trait for type
> > conversion, which is overly restrictive and prevents use cases such as
> > narrowing conversions (e.g., u32 storage size to u8 field size) which
> > aren't supported by From.
> 
> Being restrictive is a good thing -- it would be nice to know more
> context about this change, like Alexandre points out.
> 
> In particular, the line:
> 
>     .set_nibble(0x12345678_u32)    // truncated to 0x8
> 
> sounds fairly alarming, and not what we usually want. Why cannot the
> caller cast on their side, if they really want that?

It was my suggestion to relax the type requirement. The reasoning is
as follows.

Consider a bitfield bf with bits 5:3 described as field1. The storage
for bf is u8, but the type is u32. This is OK, because storage and
representation are simply different matters. And no matter how you
declare the field inside the bitfield, you can't prevent overflow
followed by silent truncation by just syntax measures.

I suggested to relax the requirement that field representation must
match (not exceed in fact) storage type, and instead bring explicit
check in the setter. With the check, if user tries to overflow the
field, we either throw a warning, or panic if hardening is enabled,
or do nothing in performance-critical builds.

As far as I can say, Joel scheduled this in v5.

Thanks,
Yury
