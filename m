Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F102ECBAFA0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FB710ECAF;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+Ruzkqw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DFB10E037
 for <nouveau@lists.freedesktop.org>; Sat,  1 Nov 2025 15:48:02 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-294fba1997bso2566085ad.2
 for <nouveau@lists.freedesktop.org>; Sat, 01 Nov 2025 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762012082; x=1762616882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
 b=l+RuzkqwIx5849FFR6V07P/2uqXMa5taRjjL+tkn6JAyBX7flT3/SsFiSsOst1EXOc
 4GJ8QLcVyklSG1NW3Nlm1Z1vlRYq0zU9h5OmIIun/odqow84ZeePB2fYLLO8P3Ut9GD3
 omxBqLFbpcnhaiF+VEKPepvI4iV4VBPL830PXhR+WWO3W+iiaTcAV6SvarCj+YuTDzBo
 RSEQ8iRFYqjzCVqoXGEDKdOE82swH5tJxo4EQXuEKs1nrgaIBmUU8zHd/lXFR4gfDpVP
 HYc46YeVkN3r86/RQaJDjt4/Rtj9T3z6yuMA09j7PF1iq2brLp0U8PUJnn84La7tzQgI
 OWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762012082; x=1762616882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
 b=kXMQ8I8BIZyqn5lhn/Ce1lwnwvlSxwMR8WqTk6PFjSY2T8rWH+6u6gGzkI1yBx7Yzu
 FVMvzzI27GynwrEfzJc3m132ZnZyVz26m0jdU7gDAo9EY8+ya/fseg8Z95kazy3yxdd9
 PY5muIW0TWEFvfINphfC2Zk4IcfzecqStmc6qgo6dSSEGdXLdLUB3cSbuOUnqjxVuNSr
 Rnw92AANLz/4YljkAfxjdodRSGui3pQe0fc8sZ69hg2M929rgGYfSZMSGf7KDvfJNA2L
 R5jxl8q85K0Roi68df7hkFvYn7fPzpv0n9+5Ch9fyeGIG6iGfw03DjIVpoSx62abLWF9
 1lKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzGS8fMkKnZHADdXUZeO5B6omXFb9BW68RFFINFMEPGZb+WWl57AOoK4SxXxmVW2yAGa+g5mEj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvCaxB+8zBCAMNBirSP7lHfnTuUFJPkFxpNdwB0I8ghB4El/rM
 ZdRPSmB3B+xJyVx9qXFn1tsd+zhXgH9aVqUszFfilc+wVvfogBSrLA4tHmIIF66LVv9Wci08w96
 nfWzq6QBbFGySbdcNW38XOAhEnnDtQt4=
X-Gm-Gg: ASbGncvoywQSLkwMH+53sVTZnrD/uXrsFdQrh4IAVhRQJgNblXdfR1vvPF9va1GaSY1
 Lo2KulxMlOF9aJtj4VpygDiyxMSk4un+1xOYdVYrvBap3tqspXTHv/RWkwyJjD90FFOh1CNIcJq
 QXmG3zZ5SI1KDJWt9Sj1mw2lL6zxI1N4h/1vasdJW2XaqPPnUi0sLVMPbd2bPzKUbG6TSZ1Y6jl
 nEGXxdPfZ20K7lOeVPMkEYhlwdjUl3p1ecLVlkcjPr0/b8IHwMhf9kp3U4iR3rgrcJ8FDc6jK5f
 MPObrxOj8gPS5mnmyx8ltxIGROih5glOIyKzAbYu+pU2Iw4yvHunDjBsEoL4f/NB4ZZHg96iGi2
 2FI2t4ViEjP7dpQ==
X-Google-Smtp-Source: AGHT+IFeUdEiRDYhzdYh9fW3/jmt01WqbIkn5Mq3SaBz0gC57ZxcOJdIQVq5xYtfcf//SPWY5i1+n1E8bScNYE7sAx0=
X-Received: by 2002:a17:903:3846:b0:295:62d:501c with SMTP id
 d9443c01a7336-2951a3eda2emr49742475ad.5.1762012082347; Sat, 01 Nov 2025
 08:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com>
 <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
 <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
In-Reply-To: <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:47:49 +0100
X-Gm-Features: AWmQ_bn8sxdowUb4pdCsaJVkR0Kpv-lxkf62UR4OPlqQBFH0kCL_DBSvQwqzdW4
Message-ID: <CANiq72nJEGMaV7=omoM+9pKvQpUTq_sXNB5APhEY5vg_6KFoNA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C linked
 list iteration
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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

On Sat, Nov 1, 2025 at 4:53=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Yup, we can probably move this into the doctest examples and have them
> serve as examples as well.

 +1, in general, one should consider whether a test makes sense as an
example first.

Cheers,
Miguel
