Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC2CBAED1
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362E10EC3B;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb2ZY7ar";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEED910E0ED
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 18:35:48 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b6a42754723so433470a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762281348; x=1762886148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
 b=gb2ZY7argjcnJhZ08ls90ODmq8jLI1TCSDdlEgz3lg/XTyCPY9vL6o7XX339mR4Gan
 VKJaJUo3v9brVQV7J1/oTWMP4r/7J6q9Lh7D22QPT7Ro7crrZjS9YBL5itK2JVOpEZvF
 Ktzn4gEQko4vethuiZwK4OqFCt1IoUYaMGJ3LL89Gc0vIXcgDlpaliUNM4Che1AOEBaB
 DDpnnzxaPphdMKrATIBLaMFekTYqHhha4bSo359gF4yuKLGfqxb9WV5gCDEI+9L0Kg9g
 FauQ8y1ARoKHVpKkGRlrPwPJ0l3hTFu3aI6HFXrH5zwVvwApV9fcKX4ELCtn1m21DJQi
 k9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762281348; x=1762886148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
 b=wTlGggXsSbvptpHzjrUL4vPVpcPSmi7bfZulBOrk7/4VV1UlANmwuXLqKgRlkn+cdb
 Y5nf6HEUO7m2M/xz8RUo7aVEsrATRgL2i7AKs70As+NPBwimbYf80KUj15baVoXOtyrX
 RmqzExzGgSuQM/8CDfRJ4VMP+SuYgESHo4TAKpadGAU0BSlDvTgTcW71CMaHjU+y3bHr
 zWI4Fe5NExNavZ8S3bXLSrv2T8SvqNEoWYU9N5ky/rv+kw68hTXYd0q0DMoyNqA3unNY
 TLzSKjdG2Ozw6TSa2eq20OoUYpLeqISNYn4vnrHu/kGtn4aH8au1Rdv61BWTNYpKyRo7
 WBTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnrt83ZnJRiq/iPdKYEJBLWaf59OxE7dFx7YzbZv+My66ujhYpNFCoKEsToL9MazS+fMJhdcjY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz78nOs1oxat2Ab82ejMTorrUzby4hlhh+z1T1p1Gy2FZczWBIo
 pRvx4vLgsLECXnmuueo26qHHRMSZ3eNOMKhc7+LA26vGLD5GF1LLP51vSQBbsELn4NcPJPDEgdB
 wgOACNZV98QDZUuooRk3NT85npq66uRg=
X-Gm-Gg: ASbGncvuucR+i3q9r0CdbOjNd1e4FBTabJxi705KR2fSBDUOx0XsoAmBdqPlKTFl+nK
 hUL4IzzQcFz7HEbiMjGRkZNtd2ZWbgKu21ExdJ8vrhImvQrrIjdEPMotqTuSCgD7a+VF5aTMDn+
 IdYbvV3sZcB7iCGOr93xYbT6LmDqL16a9ldB1YcSWJWYjg9oM/8afKqMmzpPai2hqgO0HFDwE98
 cRSQgVSJpE9437wW+hEAJXOsXyJIZzJy2twBcT/x8+hJE3XIPuHzv/wUVRuCQhd+lGuYKv6x1a2
 4W3CK/n4t3ONTgE3XZdYjVHVIIzhT9Tskz20AVWAvUCP7ANCSNzpzEOrR2hUXxVZaFyJMScBQCR
 i6lY=
X-Google-Smtp-Source: AGHT+IGILpSUE4gVnXtKxcfD5gs3NAicKe3yGxxboyBy/726/XJYsRyq6U0De47lxh6jH86MUyGGWjvhPdulmM5+3So=
X-Received: by 2002:a05:6a20:6a0d:b0:244:aefe:71ef with SMTP id
 adf61e73a8af0-34f8620acbbmr152946637.6.1762281348226; Tue, 04 Nov 2025
 10:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
In-Reply-To: <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 19:35:35 +0100
X-Gm-Features: AWmQ_bn9ka2mYlunhef8Qs1JQYv0mviCoj_SNM7trLL_sBiialuKhkFBTWi90tg
Message-ID: <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 4, 2025 at 3:35=E2=80=AFPM Guillaume Gomez
<guillaume1.gomez@gmail.com> wrote:
>
> You can use `cfg(doc)` and `cfg(doctest)` to only include parts of the
> docs when running doctests (if that's what this is about).

Thanks for the quick reply!

I think this is more about having some code essentially "prefixed" to
certain doctests without having to repeat it in every one. Or, more
generally, to provide custom "environments" for certain doctests,
including perhaps a custom prelude and things like that.

So one way would be writing a `mod` (perhaps with a `path` attribute)
or an `include` to manually do that. Or perhaps having an auxiliary
crate or similar that contains those mods/files (that probably only
gets built when the KUnit doctests are enabled).

Orthogonally, the script that generates the doctests could perhaps
help to automate some of that. For instance, we could have a way to
specify an "environment" for a given Rust file or Rust `mod` or
similar, and then every doctests would have the code prefixed to them.
But I prefer to wait until we have real users of this and the new JSON
generation.

Using `cfg(doctest)` in some code in the `kernel` crate wouldn't work,
unless I am missing something, because we wouldn't want to have a
"parallel `kernel` crate" in the same build that only the doctests
would use.

Cheers,
Miguel
