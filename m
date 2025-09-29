Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691DCBAE06
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B410EBAB;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcY1BkRT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F00510E23A
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 14:24:54 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b552e730f4aso145464a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 29 Sep 2025 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759155893; x=1759760693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ot8hcRKjG+GhZEktY+15kwYYzRMRN2qEVMOH15R9us0=;
 b=hcY1BkRTlKQwmceqNNVYtTF4n5HVCs1JTQt2yTWLsz4fVW6u6SKBRqiVJlj6JltZUF
 VrsLAOBrrnnQNvEmScRzSCd4JkGCcV1WUdGc16BY4dHDhBBvj9+D93c7K3xOUiFHKlrf
 pUJjDhwsasezKUvfS3ENyD24DP9sWBIFzxx1GUJYavDDaeYpr40D2thlnLkDN9m85DJg
 niZRs64lPItFIpf9MoGMkyQnhK7DuNmzPe5FQNxV4I1sxM+bU7/q2e4nmUZAA9vVS1uV
 ucnALl55+3NERZqdUHgE5Tm2d/EZM6aTnpUxc+8fGR/93LNFAyj7KntOGk8txrZV/Z6k
 VTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759155894; x=1759760694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ot8hcRKjG+GhZEktY+15kwYYzRMRN2qEVMOH15R9us0=;
 b=maHZtKFWR+zhqIEoT9ZxOHV8q6oWI8UP+fVgr3tUMPgxkOVD/MoE9B/JdzKaLgK8hb
 /uSFFmGRlF/kkT+LR36rlz9jfvP3h/kaeqZ0ZK7vPEGwwxn/BTm3OLOpkT7rdESA/HVV
 SmWgeRudVQj+v9eUK76UQC1f96zuKeM9gUighkAPLmFMpls1ZOoNx1Z6DmrQlAhfSsR0
 fJQ0gPywVnxrdNVFkjLAx7rF5EmROTA2S1yv946AWyQB4ILV3naISrNb9hmpyeocXsao
 Qp6AW+W+C7ntonOP/Alvz8THBbVnA/AZUOg6WcwvxWpkzyws2zphjgtTsswsXmMG5ONt
 al0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9SQIompoJinj7X+6ZidkBXZnTr+NMVvK3pVjvVn4Kmtu7XQgBnKdNowp/K15rhDTP+atkUcfZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs0OFQ0zAFCfTArRFEdNrmHgn3EwNoAsRN1ycae31V7vgxstcr
 mWIW+tnukf3m8Ix14UamFeAldk6ZvM6nMZY8vnQ0AUf6c/JfkK/faM3AEP4nK0FF4nbEr+5DxIT
 oFWFL3K8tLAMHWQTiQtE4tHTBDEaSpoA=
X-Gm-Gg: ASbGncsG+5mlqLoIe+P+0pHRZ8WwUat04hYf210KV2baq9QLSiSitAmrMyMJEZd3/H/
 U/hMaP/qsOLVedA9fhFDNLhVNiDGYG7uJ6R2O6FFXF8C7E76ymqJF2RQq8glwrXwzKwFyYcQJHX
 KADQEJ/Z/uHZl4UAKZmzGSfb6Rngofe8ZfjnQDonaCitdb871KOIMehXbNzX2wrU2s3LtEEK2SK
 Tsj6H7IGng9+1++mqWUiEH8tLXTl60Zq3N+Xa0FzQEtiGh2tNSJw+QO/AP5DolsAo1OVK644fqH
 3L6qZXezi+ElQNnbD+9Bcl1c90HqBeAM3O/A
X-Google-Smtp-Source: AGHT+IFO+CKcOfhjq3yagbAUNFRqtJ2JQPPv6IOGwZ4Z+4FHLSqV7RrX0bFPoMZ075YnvnY3rrn95mijVFVOb6eOUBY=
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr70259715ad.4.1759155893602; Mon, 29 Sep 2025
 07:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
 <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
In-Reply-To: <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 16:24:39 +0200
X-Gm-Features: AS18NWAQUPZbXtjWExl55E-tjUwblkbPBQ5uQeLCMefcIVbUSmtt91RPmlpmau8
Message-ID: <CANiq72na_d6JQdyZ1S22mus3oom_jz93rpY+ubr4yOuvMY_fSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
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

On Fri, Aug 8, 2025 at 11:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I have tried this series on nova-core and it allowed me to remove 150
> lines of boiletplate just like that. As far as nova-core is concerned,
> this is a perfect fit.

It would be nice to see the (possibly RFC) patch if you have it around!

Cheers,
Miguel
