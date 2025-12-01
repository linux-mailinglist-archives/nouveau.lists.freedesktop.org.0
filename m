Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBECBAFB8
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311810EC9B;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxotbmSJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED810E4BD
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 22:58:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7bac5b906bcso549397b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 01 Dec 2025 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764629938; x=1765234738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
 b=IxotbmSJsd/X44ee+0EfVdjUaaIZZLVVUs+Qgur7prs27YSaKoK2pUYyaeq+vu4iKI
 zvk3NJIMPQmuckhSt95R1tylWvgYHBCMK8+uwbi6/D7Dp+lH8wCulUr0qhJpIzbAAqVA
 UHqMVIbLWekkBDrMeMD59+SHMMFdk7MGoiANUBU7oE4Rs1wOiAKlIHeDusLnlIe3wk/z
 U+VBfTV0sk6xB+3sjvWe1jKP7pEVkkJC9FFU6AecCRsUS45kLneHIRcRYXf7XAJ8BXL5
 DEcDsPHoavwAGrsNpSs3Vo6NzJUEn+QsGLUoYs+LtbOjpwtH9PGkvf0eyOjA6hSQBX6W
 SdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764629938; x=1765234738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zyWPxm7BxHU2DwXC/shC6IQcOtTNXj2MQcP74sbsrkE=;
 b=tcy+7Qhv4dBV3EvC5dgo4n5nx+lBaGqvzH71TePbONRJAZV7W5By0IGkFvnCqP2uot
 9z3Lw9OeU5x8/LmjFe315kpcKORKLygWd/XAsp8Z+CcnP4QnbBUt8tHFruGXrAC87fJE
 eQoTG05lJBuIkayHWXpU63WMOLFUc+IqohWF6Ks8DAltg7d8cuvjaYnFflfV530yaRr9
 JdSexMav//IuBA/JPpmnDimOBhr53XA3alUqZTe/M50MR3dAN68t+lSt7gVrlQwnGFp2
 3witDDerBCDnLzgelGpMYHqVzKdK048CO8/74DoxlDkMU8TfEjoDL8/IkmToT/HFk7fo
 mbJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX44jUhc6xpxNKM9Jqs1KsZEYJ74rAo+03hpR+l+H/qXPVhNUoyK1suDHDssUeoHPo1J3QkKxsu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyK+5Z8ySO0sEbtDzsJe7p6WEN/ROCIx5eiQQimGSAZgt8wGmg
 99GolNoKtAmwHiNNHuEev9BQvRM3I8xGIvhxX427UpDPCtOEen2J3UuAqgtXq7/zKf0W3X2zaLJ
 Qpqus7m+HndaeZAq4je8QbeDPjfuhaKI=
X-Gm-Gg: ASbGnctkVt9e5mX34iOZQtVZfB3Q1+CkfaoUgF5OTAr7pE8JUx5dIVKqPkyTqXiMYBJ
 bK3WXgL3UxtwNlpfxWXp87EGELHAfnb6b+gizYMi/XHzWsm2SP3881ZEdcJx9VNIxj4pqMZc753
 6BTDpu6nPlFwLiYt0xhM5Am6utfRf0yaNNO5RQTynapbSnHKXlrs/UDEMU8lUwo7fcQY4mAZZBM
 F5w3rlmRhWbs66YDtkQelx1qIdu08RVDe1a9SBcPTN2oXWHu5ZCvSWI/OkO3+8lzbmAgGKrXdB2
 WgUzY0iwHEzZr6DCGgId1WFj4F0+8pPOg6Hhwe0mYZGKCoFH+8KjzTanBZZOV9XN3TukiYRW5mB
 jdvIFSh9ycGMkDQ==
X-Google-Smtp-Source: AGHT+IHY+FeAItpAcrc5Fq3fIXt5nt1KC5tdgt+lz+Ap3b7wKK+vwNPbBlkNS7wWrophFDdlzmuDF0mqMk5k9ykfKLw=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr22701116eec.0.1764629937707; Mon, 01 Dec 2025
 14:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
 <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
In-Reply-To: <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:58:45 +0100
X-Gm-Features: AWmQ_bk8XBPXNwQ-7Pod4UntjM0rZKNAiZHIZMwXF3_mA-n9qMS1f4f_JysZoCo
Message-ID: <CANiq72=V9TvPPvx=nAOciSZKVQJy+YBgLmPTt2EGo9bGrthdog@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
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

On Mon, Dec 1, 2025 at 11:55=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Yes, this is what I meant.

Sounds good to me too, but if enough people like otherwise, it is not
a big deal either way.

Cheers,
Miguel
