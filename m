Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D23CBAFC7
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7D10ECBF;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyU4lpCm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5DD10E52A
 for <nouveau@lists.freedesktop.org>; Mon, 20 Oct 2025 21:34:07 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b62e55af64aso154699a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 20 Oct 2025 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760996047; x=1761600847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
 b=AyU4lpCmGrxKOD3IbKwZB+A2cHtg46X9gvFDDUAQeXS/UoO17xmNqzof2Tdr6hmDNe
 uO9AIDmDv4551YT4jZblphVkn4tNahlV85El7cI+7NB1u0oFJAdbwI3mIZNxB3/QJiEu
 ydsbYQRZNGOaMk/nna41tdeZ1OKWTU5M+XixQW7ty4xfQuLBHkrclWeHBKyhWa2Rs5R3
 3Pt1DPJ52lqZf0U3Vmxk+xpu2NiNm7lI6eg/4JbuLEJt0DbZyUr97vxMvnlmZs2jQXO7
 6ASqvDEfOAoFbHeeZWsOsRYM3QGj8GFucSZKPSvo9dEaoSOv6oWVKnAaF/VsqN5oYEfS
 E8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760996047; x=1761600847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIA8kHBtPk6GgWmqAWWXnwTpPlJ3gJjCHeq/XdJy1Q8=;
 b=v62pTihBSG6f/tu1N9brk6sW1lK/qRgTQ1mOau7RZIirVRy6ANj5xYPZdOJ4FDPTUG
 Bi4CpirIWDKkSALv/ZMTWd3btJd6+MZzWEwRJbRCTv85lzrAd6Kti1j5d1uYMKxU6eBL
 dEaArYleB7yJjYMypfgsN3Q/manGePiA4oEsnUI/PJBTJ4MrSivE5/stKEuHlc1qwCW7
 jr48/iZGel0zTI5ljkjDrc2LziSVEb5eO9Tt+g5J6t6TKizHeczJaD7hWec2+vBUF1Lh
 Vk32cN9DxtvEoMFT2JKZvcthY5ihAd5iAPs13f1mtnTjON1EqGSPGQ4V/vyHyEknRNJW
 uPSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWROOiWbfTU96B+pcXwOs9mAeaWTDKs+OUMkevPU2jI3gYClRXIBBVBGNVEVbMH+cPMisMdjQSz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtBhdLwJgabVd6oW3lYAMSIyouFceOmWtsr4Zpit3pP3aizFg+
 KahuOTO8WVd/S82k6pX0pJ5lxPVf9QccGzzIIOEekuJUu85ud2lLgL38yXNar3a0euRV5J1gb+g
 gSHTtYTcYvvqpmIfb/jfkYF9v4ve6QN4=
X-Gm-Gg: ASbGnct+zzIwUaKVVO0r+zQZZIxjFpI+Tg8Ez+MiQmM1z8TPmFdsJStJsa+mp9uYktg
 AtXrD62MsgIopedoeGCJIf7fvhgOunziUAGdCwpUMHooG4Gvfx0c4EW4N+RL/MTLumZqSTM4A9d
 eXsSacpTdhoymHoUHNuzbCygNN+Lp8gGmDcHxiDah+4veYHMtixjMxUb5h33PUV0KkntUkkHgD4
 8d+cVzjHvGwo/m6FsFgwnsmhqsdwDzrM7P66e9vEk1lpaLxqq7XdgeaD3ZLwliiOUtqmQFzsMuC
 ZCJd+Zxh5sZmcm3zW9WQtdwHYWS+XnlEJ3ufpgJ4LKP7g6V8CWoUGx4UHyc+AGsTp4/X9b4Bke5
 Sz1ymEXrlkHTfRg==
X-Google-Smtp-Source: AGHT+IENeHKMjyzGTYHHZV28uVbTm7W0v2W0HGYIwZ1YpX54wVhZRXd1wDtmMhBidXjOzxTnYzIEdPK9TNFHSokqIok=
X-Received: by 2002:a17:903:94e:b0:26a:3c75:5241 with SMTP id
 d9443c01a7336-292d3fcce91mr5493965ad.9.1760996047308; Mon, 20 Oct 2025
 14:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-2-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 23:33:54 +0200
X-Gm-Features: AS18NWAADgBeA1nYLOcKyihsh6E3dmd5BWRM3ztrLw4uDz1-mBK39vAmoeM9Wwg
Message-ID: <CANiq72nGPeLvrjQB-62Ht8TR7oWPgF9HFO=yPX7TT3faqxnNFg@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: rust: Fix a few grammatical errors
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

On Mon, Oct 20, 2025 at 8:55=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Fix two grammatical errors in the Rust coding guidelines document.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general, please submit independent patches like this one
independently, e.g. this should go through the Rust tree.

Thanks!

Cheers,
Miguel
