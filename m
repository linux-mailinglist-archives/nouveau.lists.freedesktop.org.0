Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9FCBABB0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F21010EA1A;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="YauurWJr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB5D10E42C
 for <nouveau@lists.freedesktop.org>; Mon,  6 Oct 2025 16:40:33 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b520539e95bso137776a12.3
 for <nouveau@lists.freedesktop.org>; Mon, 06 Oct 2025 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759768833; x=1760373633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
 b=YauurWJrREVBnozB2Q7B+T94yIsqTkvl2kzowEVT9V9GsgwkF2Z8hpEp9DefnjWUUS
 M1MCm0rsIT3vYrKkKpDubIE06MpEx33AuGZt1GHFgmHJxYzybCV3Llo90F+FwR5xJVQy
 CsMup65BngHZFS8Ysl61TrFZrujfUtO68FVIzhTSAkjMyqne0thiNtpJkWEFGJE65/yF
 7j/D6r0dX9NOwm+ZLOEhAntirlYA6PfY6YBLcF+ixg6USEGbQrSCISyH1iTyWyrwbaKv
 ctAF+wFNAcyPksaOaUBKjLXKg/6QWOZLhZAOV8rRvnXCImuuR7BCgj8e9EzSxngh2tFJ
 b3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759768833; x=1760373633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
 b=B0aUgWBdFAnMRIYYTj0CCvjCYHNMwQ65m+EWAi0w03cpFlW5B2haHknBjKwcbXwIKy
 KtpvtDSR/9KHr6xUS83VJv772RYMm9QQ5bcY25Whs65BB+s0i3gRPOTCJuOLWM1vJ3pW
 oG14JQu9tcvGh4YP3ZO8bhBCx18acCrfwky5wizxqG85eO3tlOBfSIcAQHUFyMoh13WG
 jpGy/gOpJsybbORJKads2vmu+E6cucJxKq091e3IPfJCFu81FaPftm2xsMuNviabKPUK
 yRmLCyR1rSlDcpCtbwRwByCogKMQWqoYQn764/6xbvQ3y8UAxe3ZF9nr85XzyHrSGggl
 QXng==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8A7bgB56/7/7DDR6ycLTTzawo+eHKJsIiykqEke4c9jZBHFRyN0oSjTnggSzErAXAE5Qg2/O0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSMeVNg7NwlX4fpSXrf8TN8sLvXaRL4pOJUPhjl+M2CgvrHoRF
 i9vYR4HxDzZrSM5z46xfX/gQf8/UYpjpSVGOAOE6lbu/iwkFB5S3b3EyputMkfbl3Yj1wUey8GE
 HM0P6RHzjNfRT58Tyqkdj1CYjWl0P41o=
X-Gm-Gg: ASbGncurSiwL5iXhZhd+KidpzmdOnF+IWrh9HwahrZWgvHZ2skzaw65giLCBYjbwB1q
 7dJTVOZ58XAH2t8ZpBKGk7d44/+rzNhB7zkL8AS0vo55Uye7Fo37x8xQIdmJHvXtjDTCyaWmViK
 rURynOPM7AIkVy3GrqQMXYQM+oJLD77tzeTUIoz/Ksak1GRiEHKzkKT6MD5qDubOoyX41UQfXu8
 bF4h8qxA0Aus7KRT+hPTSKiEnxyVxH9wYpE0ngmd5M07RGOvHInf5QKQHv+4LLZXDzMQiDWNMCJ
 7RU97QgDak/TkQZa3t9MCR1sr6yyBOqSOC4C48r0sYxj7GtvCt94BYR/+qBp
X-Google-Smtp-Source: AGHT+IED5q3x4DCSIrQmSNaI/hNM8JVZko4zCwH8pMSwHQyx8XQQtYie0DUOqb6XI3JebRYkGwAJqCnOXAShGoi26PE=
X-Received: by 2002:a17:902:d4cb:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-28e9a6d01b1mr103155035ad.6.1759768833343; Mon, 06 Oct 2025
 09:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
 <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
 <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
In-Reply-To: <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Oct 2025 18:40:20 +0200
X-Gm-Features: AS18NWCxy-Hq0OsmWL4xZOPiIrqjK1XDIHFlDGJPGtRa1Eva01va6UDuU96QULw
Message-ID: <CANiq72mC5pWz92KYtOhtgOcMuTeuzOeM9xrbkna+HkrwHAQqVw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
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

On Sat, Oct 4, 2025 at 6:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Well, it can be efficient. It really depends. I have been contributing up=
stream for about 15 years if you see the git log, often when someone chats =
privately with me like you did and they told me they are ok with a patch, I=
 save them the trouble and add their review tag especially after they alrea=
dy added their tag to all my other patches. Surprisingly though this is pro=
bably the first time anyone has been pissed off about it.  Anyway I will no=
t add your tag henceforth unless you publicly reply (or you let me know oth=
erwise by chat).

If they just say they are OK with a patch, that would just mean an
Acked-by, not a Reviewed-by.

In any case, the documentation states those tags cannot be added
without permission -- if someone gives you a tag privately, it is best
that you tell them to please send it in the mailing list instead. That
way there is no confusion and others (including tooling, e.g.
patchwork and b4) can see it.

Thanks!

Cheers,
Miguel
