Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED0CBAEEF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBEA10EC4D;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU/6HIqF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B710E29A
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 17:54:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2951e58fa43so3932055ad.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762278853; x=1762883653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
 b=lU/6HIqF9hOGh3UCUcj+UbBOr8qML9l5gZkZUQLqg0WSFBROoKEoh5f4Ukxl8ChNZF
 UxrzHg5Vq6Jeg4sVbk/qWnJ8EVFK8swcze44Mw0VJAp+nPqKN4OXNMzKZ4kkTWF4HUgI
 kRIweMsmqzGQfWdTk4JP3+QWotMHz0uWfFRwiJ9MiuioojyNOT3B+QjTddH4F1lgCUJq
 4FYSp67Xks6E0AVHC8gZfpCSrzqE2K37DlHDipcIdjRBI/BSYBBNpcIcbeAqKR1SEgZJ
 3Nim1AEqwaqDUjqekCM1iaLy4nrBDOhdC+Rq6YK/keLLi7bEidQ/cza1BlZ/RTPwU9pU
 pAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762278853; x=1762883653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
 b=jsbokUawQQgPvmRQNHIbbNp3q5qEv3nI0mHF1M1odL2Rr3yy8o6z5EIEwRn72S9HuS
 fkCXDqqlXGrN9YPEZoXKez53SNmgFdVgKDM94xMewBIUyranOsLPdfwN7EgZ++QG4ntZ
 zgMdNPVERcehZ5M52tP8LtdBOAJ5VMuYRurdnZfuoH+joU5tL+YyBKDUELrGVvkmOm92
 jVOgESRSrex03jdfyl9LVS9X2CL7HAejjAhNV5Gs7YGA/OkazgvUu+uCs3Z7+uHb99TR
 hV/bQropudWkoTd/2f4CXrwEtMsm7IV5HsbvKlmZDzmvasBt8mkE2YCAEM7SOSynKtRp
 OjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzfMMblCFRHef+MTuVopQZkua/d3aHJN5dWlioAJla5TXV/vQD62hLuLsPtwN6cFiZyC6qhNR0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUR8PZqrv3S9ChzzpEbsXYjJq/HiKfnqgpPsl3/NbOxSerDDI7
 y2+4LhfYRw0EIn5xHN0sMRi6CQMuYZuggfYaeSTwzjF0nA7kdeO3b1bz+kRisGDJ7ISYs+ErA4K
 DHbBeEK78STdY5BZuVBl93OGKgTFcmow=
X-Gm-Gg: ASbGnct/q72eauqUIrVKZJ96a7jyPgQr05unmImnWb5dvvcg3WcC91wYAzKdeJLyZkZ
 93YYzG3/F9FkRfD5UyQ9QpwTAaID31j54luhYy9Vi1/JX/3OlEXWSYYrHN1fKfv6wgfGY3RxH4a
 fOddnreLjsAv+ND0dlOHc+kk+jseQehCDy+jePnmSoXVqALG1IOG77zWa6tyTUte7RqNYwkUTHz
 Iwp2+14+oHW5ydRNkcwUbmSZUSmErHkWVECjFiD+po3HOWRNhVfK/UVAa2zAZ0vn7C7XibDRlpl
 s15sfGxWkkeBxWC9exN7lPGg/inaEmIdV3e6vM0MqCjaulDMeFG/GGBaG2H2IhkrI+mLOIA1/cR
 feLc=
X-Google-Smtp-Source: AGHT+IFMtgciB6QONB6VxZCG1myoQ/OF5p9zSByGfEAwuejN7MO6VmvweNifh8ze36q1bb6i4v+fU3wfRfdXIBYH7Vo=
X-Received: by 2002:a17:903:32d1:b0:295:a1a5:baf6 with SMTP id
 d9443c01a7336-2962ae52bc0mr2728245ad.6.1762278853136; Tue, 04 Nov 2025
 09:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
 <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
In-Reply-To: <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 18:54:00 +0100
X-Gm-Features: AWmQ_bnlFTvkhYxQQsxRU1wVA_rAcYxAjX9HSQxCVZanIDspjsve6Q_H0_KRQ5Q
Message-ID: <CANiq72mqDWrLp9EjXHUgeODh1zh-9XaUnmgHWGgX2Awqs4G=cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
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
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
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

On Mon, Nov 3, 2025 at 8:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Thanks a lot for these, I studied all of the suggestions and agree with t=
hem.
> May I also suggest to add some of these suggestions to the kernel rust co=
ding
> guidelines document, that way others new to sending rust kernel patches d=
on't
> miss it (example not adding a period at the end of a markdown doc header.=
). But

You're welcome!

I don't think everyone reads the documentation, and one issue is that
the longer it is, the less people may read it. For instance, the note
about using "Examples" as the section name is already explicitly there
and other bits can be inferred from the examples' style.

Now, in 2025, thanks to AI, you actually have a point, in the sense
that I assume people may be able to point a patch to an AI to ask it
to apply the guidelines from such a document.

So a good way forward may be best to have a list of "short
rules/examples" in a separate section or document, where I can easily
add entries with a simple example without too much explanation. Yeah,
I think I will do that.

> Also a lot of your suggestions are related to how it looks it rustdoc, so=
 I will
> try to build rustdoc and see what it looks like as well, to get an idea o=
f when
> things in my patches could be improved.

Definitely, please do!

We all should be doing it, especially so when the changes aren't
trivial (e.g. adding an entire new feature/API).

I have it in the "Subsystem Profile" document from `MAINTAINERS`:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

    "When submitting changes to Rust code documentation, please render
them using the `rustdoc` target and ensure the result looks as
expected."

Cheers,
Miguel
