Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD5CBAF8B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33410ECA2;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYpO5of7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3890910E60A
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 14:07:28 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b997ae045b7so255257a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762265248; x=1762870048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
 b=HYpO5of7+ChUFiFxcq0BpEVvNZh0YfW8ct8uyHSU+j3MchH8r7fx2gXBZLYrPzo4+y
 Cl++etFLgDL6PpZFLaa5FSzeTzluMEQzi2NZ5LuNNxBzdeNh6j644NUtNbM5QlhkIASh
 FXZYRDoQXnwmHd+wNIuMKDL6L7RDeEGSKhGjlM8C0p3gyV4Vm6AyxFUnoQhMw88O5olh
 fDngacDftzcON7kk1TGLLnW8SWm6Yd0+esPEpFyv3OKjTXQ2nDVhG+tX+jmvBJYsHhj7
 +96P97Thao9Wk2C/11JzFqMZYEzEP66fR9pQqRxsJD09oelvsX+vULocAFgirIsxCvnu
 2e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762265248; x=1762870048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEGyLJUT+zzSFJ95q6Pkl8/xdguEfP2nRB1yIszhyZY=;
 b=mutTtLBtUxK+/xSdEUJzsvOS9noSPRmg6h+Qq19L0HkSCENg7Hz/E/GnE+7BrD+W/k
 h3Jvn01tiFRGHtYenW6KDViqNVTIS9eO7qy+Wkf/JIyMt8RMc9j7D+KEcJE6m2LhmDVd
 KiOmwFDbZAb2WmqGnYtDRkn4KaGCdUvNiTRTaCQUgYp4JE+OBHXIF2EfHbOpqIaS4HN5
 Wv/bD9lbBi2PYvz5STlXhuNhfPBMh3i0VR60ZRzlpvkf74C46F9/6JNiXijxN+lvU7wR
 DX6+62blt+I9g22JZ3qw1I40q+o2IBC7Pnk1U1lhG3UeyiIBcEzB5XNS4nHigwRNfWwC
 BjHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmoqCUUrIiXe8VTel3ieeG3FJZofEhInAUAYMoq85K1PWv+gI2aIJLTROz3dAdEut6Kf9nIsZt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAhWOIDq2nJDtgv5HlkWEzZ/9ujn0Bon1UvYPGrabsKAmQYUdi
 B5fFlumU8jhiemD1TwDfK4D7XtbSObfP8lBZj8TO0nEeGAWGg/ctc11zmz6qOQk2kvP0pvgrodQ
 sr5WqU7URfS4RmwWlNE/HaWCu/vji/1Q=
X-Gm-Gg: ASbGncsjtnNKDTClcu96GpBfXMSdLU+HLxkXwSJqQf9ZkEBQjo9/YUVIUwnApZAVinz
 bSIOi7WNnE89phkEBKSNbrJIEUPstx4GSmR8rnJz/ba6R6Q/3BevUOOVJxKWZJY77dZ62Fr/+qq
 lv1NoUQ1aJfoBXMKXQxAxeQh2MB2LfehKMTJFpeoqIvhEOfxSl+AUOGh33cr/KTJrh4xXh+vxgt
 Y5DGrjU0Gtz146ifPH0uii1JJbvtBl+ph1uyb1Hju8PueXydDixwEJUrcypUz2cXmj3eA++PS8Y
 QLTY+OLAVyAk0iZ00yPQU3R9NW7LkNWUkiNtkB2iFol2meshLmBW8tFjx7NKN0YrA/dydk1kUQ8
 sll2cwpM6BdO+Ow==
X-Google-Smtp-Source: AGHT+IEoQt7wc4QhveCREcNLj59n0mc2+WwtyT6a1zVCHIjoX1thJlflh/bTa19DZhwmYOUd1dkkOIBrsDu+HwIpQfs=
X-Received: by 2002:a05:6a21:a44:b0:2df:b68d:f7e with SMTP id
 adf61e73a8af0-348cd411b8cmr11613230637.5.1762265245767; Tue, 04 Nov 2025
 06:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
In-Reply-To: <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 15:07:12 +0100
X-Gm-Features: AWmQ_bnRfHv_8j6zHrslJDNBWq9rDs6IM9lMFZ907aXIc2-_3edh4KvJlGf8RU8
Message-ID: <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, David Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
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
 Nouveau <nouveau-bounces@lists.freedesktop.org>, 
 Guillaume Gomez <guillaume1.gomez@gmail.com>
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

On Tue, Nov 4, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> What I'm more worried about is that it might be a PITA to write. :/ But
> maybe the core folks have an example for how this could be done cleanly
> and in a reusable way (i.e. we don't want to duplicate the dummy list
> creation code for every example).

Using a shared module/file may be good enough, as long as the `#[path
=3D ...] mod ...;` or `include!(...)` is hidden with `#`, i.e. as long
as the user does not need to see that to understand the example.

But, yeah, we have already a few places in the tree with fake `mod
bindings` for doctests and things like that.

Cc'ing Guillaume in case there is a better way to do this. The "have
something applied to several parts of docs" has come up before for
references too (the "external references map" I proposed).

In any case, even if the example does not run, it is still way better
to have it at least build instead of completely ignored, because that
means it will not become stale.

Cheers,
Miguel
