Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDECBAF76
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB7010EC9C;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbqWbkts";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4407E10E80A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 18:34:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b9da0ae5763so1446a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 03 Dec 2025 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764786892; x=1765391692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CMWZ3qAwUwyBhAnMKin7Wcb6R/EuH1ID91cRmby9KI=;
 b=VbqWbktsGUvquUadyCN7mI63l0IHioUZk3iumP+8a6HF+N1pD9E71Y7yfcxF2ghVUY
 H3utWJU5lmrGRqF0vWYS4h6BwRMrLxi2nZ1mN5ktVjKM88haoHVhPPyGzN1FBYZHvdDg
 ROyyLxT/Bk1+fRh+3jEigOeugPFdPWe4q8V0wea8AbeGK6kwT4Lc2kfccO84XJniCtEL
 Zl4rQH0id1gTBU2qzWJE9nBZHq/89l81bc16QXYGKqWgOOTzi1UxeN06B8xyxgkiGo2F
 tOGos1JflpfyWi+6Guqr5LIoMesaRhRU8BZuiz41VtIaLbmvL0gX0oOnetIX5WvDUWB4
 lojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764786892; x=1765391692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2CMWZ3qAwUwyBhAnMKin7Wcb6R/EuH1ID91cRmby9KI=;
 b=eZ0ENfphykbWy5WdBM05wkIfTBsPVR/6xFs8MKA/TP0AQyZUIMOGnB/+plpRgHLNnS
 oOc5sP0xfryslAORX2EbvUOtpzdsBAN0clkeBSVL2qaO+IYwS9qBAu97j8R8jmqBSc4f
 hikJM1JfvPHZFzE7x8jbJ8qrNRxak/9bu2rn9ypcuHoQhHTcm7BtGo48vooo/cWa3wQz
 l6+xGZhUVUypK8XOENFWhJAGz3kfEHGN98AUDiFN+LAR969ukF4GKmC/7QeoLimKGKFu
 iIOCMgTu5AfZkf+/8IUNqeAmXvzQYuLmIDbVa7Bay+CqzsuwptN4lQKr+pjdiN8T2+Sr
 TjCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUou7RCYKZtelFJ36jWfBzJNsH6+IxKO9ljZFY1Z5CMoHx/eUwZFhGcT4tmB0SAEjSJUVjKmiAZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXxtcKPqkj0fzjKfPwIi42XxAcbyFn5VSA67BycKzViPAZ7nnx
 lNfxbvoi24hzoExQQFlNu0m4JVTkvK5V/ytRcCa92Jf7xGE9GdeYGk+8Q9BmQDN8hYTUlJqOyQj
 lEoErwYM/Xw95q52unk6dZWwjY0WP6Tw=
X-Gm-Gg: ASbGnctgLostDStM0VTzgylIw07o3iaY4MZ28rG4JKt43b3SQTN7VE0Q0UKP8vrhyTr
 PDvBwDTAmyUuvgvc7eURjpjT8ATO3FINFnpKKDv890rpqaad1vYiKQlNZruqDhMUeM1CIxVG5nA
 ltjB6lrFtz5B8R5r/gq0QTT7WyqrD9ymgVg1K54bY7+8auw6C1P42KRUICXwnNefWumSCov2kPq
 M/J46e8N7A4tNjjZDKySRSFIF53N8uYpnvWDgHR3/BJ3wSKe8Yr9IQRES0Cy+RCUfYNQBG4F/lG
 hn93nUkr5qtVIV3F/+iIXpO0V7udtz6FgF3HZCU46RtG49vZ1E0bnh3TFpbG4No03IYO0Cnc2X2
 6IJexSq6x7cYUhg==
X-Google-Smtp-Source: AGHT+IFa4V+Y9FyhlTVYSyy1JMkmi9f/NngzmjjE3IEzgbmLwubfh9xfKe7h/9zsaCRjThZ3LBCKnOLaWeErPRtNuyM=
X-Received: by 2002:a05:7301:e0d:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2ab97ca970amr1171255eec.2.1764786891475; Wed, 03 Dec 2025
 10:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
In-Reply-To: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Dec 2025 19:34:39 +0100
X-Gm-Features: AWmQ_blu305YpWSaZPgtyEsvUY-AE81K5BtUh2D6y_BVZiUesA5SswVgugi5Dmg
Message-ID: <CANiq72n-E3Yhgn=zioZvOLbKStLbrTfqDbEVY1-vbETqRYmWxA@mail.gmail.com>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
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

On Wed, Dec 3, 2025 at 12:54=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I know it's a very edge case, and clearly indicates a bug, but the
> general rule is: don't panic the kernel. And in Rust, if possible, don't
> even let me compiler insert panic-handling code. If you don't want to
> change the return type of the method, then maybe use `unwrap_or` and
> `inspect_err` to print an error before returning e.g. `0`.

In general, indeed, but if it is truly something that cannot ever
happen (as in one can prove it due to how the local code looks like),
then adding error paths for it isn't good, especially if they change a
signature.

In any case, if it is decided to continue execution (either with an
error or with a "default" value etc.), then please use EB, i.e. adding
`debug_assert!` and possibly `pr_warn!` (or perhaps `pr_warn_once!`
once available).

Thanks!

> But others have already thought "naah, that's never gonna happen" and
> got burnt very publicly [1], so let's learn from that. :P

That sounded to me like a higher-level design issue, not so much about
`unwrap()`.

Cheers,
Miguel
