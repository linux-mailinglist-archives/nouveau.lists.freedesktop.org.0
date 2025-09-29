Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037CCBACAF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C187A10EB9C;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="laGcVbgx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338C510E427
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 13:59:45 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-26816246a0aso9467145ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759154385; x=1759759185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
 b=laGcVbgxNPePL+/QhwUgn4GrGercTB5+tWN38As7RCu6T2zCrKTeyi66UGWzNIWAhP
 CieqPQnsIplkdC4F/aDiZ7uLVyGvG0sekiaVY2TPBA7Uj9r19VvgZeXsD3+s63clYfkJ
 nD7ZbPnJLaPojrTHIUkWX6n3gv8Staopy7eS9fFsimkbqzGWtAVt+H7y7CBwUuunjdsW
 ehtsYPhxLS3AVhJ5Wr6Jgzs0UYC/MKaGv8HibrFCADCN6zW4vbcHaBwv8EOZlcAVB5J/
 q/fwGWewJ5GtqO69JQ2V1pKq67qqWbhgjN+CG1MjGO9sAcK065hYoQ9iNKkcnNo14NyS
 wf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759154385; x=1759759185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
 b=p95LUJrG1EytvYNnTQGJW9QINJbWIORiTj6Nt9gT26GaKfXyRtrhFpwf1XUpMSzkL4
 1HlItpo5xZlxxWlKDMq09lc5m8MxpYmkJryiQDs8N6orHw3zooMBDWJjK5PuOhNIkpRG
 xAPXTJYRzlO0uJBDkVe2fRnPkENLvgZyu1IJveXu00KugBl11XIf6V6iPO8fDRDbiUYw
 s1Cb1cveIwp4vrOdDGwITW9xqxeNp/lWyQ15evKa5Bu1S2s4zA4U5/9MPzPI2LWD1eqv
 ht8fNusW54WoL9nog7mo9a8b/RtVktCcOAz397P3/qQO4otMxl/yGaRDVm8/ffLfD0m3
 wKZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEo6hLHGYcSLxptoGNonXoSZi/wCEdaAckZ9iEMYCkXZKMFUMn/H1DHxlneqadP/1AeJKWci5P@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy69URgLtHq1HIU6keVQpeLrE8s0obmtqGPJjTg+G5MmTLEX/0F
 +0dRrj4AykvCGWTV0rDeMO1F3zthPp4x0fj3Y70uj8tECtFH/NRwtM8ycj9FHJ9qxcL+47vlD8V
 K2ZMJEMcryzJUaiRh67EALsfVLtB/XSU=
X-Gm-Gg: ASbGncurIZZkEVHeCOGJVFamlpzcHjU6InutmMbKAudMFNHwZTdYrUjTL7DdIkoAWM3
 YlZ+SZ3wxlKQsyNJHrX9hCsQrJnw1GcNsFEWHBFbJ+yaW8HIMPP/vDFHtHPPksCloB4M0DCNsIB
 TLlvi2lJw5xQWO+gEzpxBPtzAGpWe+04TN43eg6s7URCJFwS+tEwCTTRuolylA3NDRxW7lrJRJq
 ndCwwPzq8Um2J5bHlBujFs1O83v0HdLlxLGS8845OB91Kg5E6pWFTx2KK26dTP1IbfaTm8EyKYw
 9+uGHvfNLQ46SQpW2rx3MbZvcQ8x2wKh7al7
X-Google-Smtp-Source: AGHT+IEC1OH3LVB4V0oxft7FgJLhEwqNNj6rUnyOmnwsKLC7LLfd/i5cH3v8mOBtoJlF7/5PaCpYXgtDTbDZevnth5I=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr105372055ad.10.1759154384643; Mon, 29 Sep 2025
 06:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-7-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 15:59:32 +0200
X-Gm-Features: AS18NWASygynDnatU4KPTeDzNXeVtgwJfzlJorCLrDvtP5k4ZufDBjnqp0W75-o
Message-ID: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org
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

On Sat, Sep 20, 2025 at 8:23=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The bitfield macro's setter currently uses the From trait for type
> conversion, which is overly restrictive and prevents use cases such as
> narrowing conversions (e.g., u32 storage size to u8 field size) which
> aren't supported by From.

Being restrictive is a good thing -- it would be nice to know more
context about this change, like Alexandre points out.

In particular, the line:

    .set_nibble(0x12345678_u32)    // truncated to 0x8

sounds fairly alarming, and not what we usually want. Why cannot the
caller cast on their side, if they really want that?

We avoid `as` for similar reasons and nowadays enable some Clippy
warnings to prevent its use where not needed.

(By the way, please follow our usual coding conventions for comments.)

Thanks!

Cheers,
Miguel
