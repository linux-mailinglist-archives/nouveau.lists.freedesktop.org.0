Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F0CBAFA6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668710ECB0;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3UWRkEd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CD810EAD3
 for <nouveau@lists.freedesktop.org>; Fri, 26 Sep 2025 18:46:15 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b57d676c604so240569a12.0
 for <nouveau@lists.freedesktop.org>; Fri, 26 Sep 2025 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758912375; x=1759517175; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99NoFsVWszwLzL0dGnY2jV/Q+uR4we2DXyveOu+4Occ=;
 b=L3UWRkEdfnNrnLnuF/EG09UbNXFNjaaf0dsqYMkGVywBGdCUs5eEmXhEPbV3wVaTmb
 p8mwj9waUqZLdHO6Cs5XdZQJy04LMWAvFWqUalpFsKaFD7bZRc+tf8nUaSaW2RguUcVg
 2bg54UwkTWJhlPpkwSD4juyTcUtT2jh5sGiBFEXaj66s0p6dkb0wyd4TkwMAYmvStBsI
 N/F6EUu2n9EYXwa0p1KO0LzOHn3Yl9FTOUfdulOulNLn5hY5TSYatjZzUgxaI4VZpbFr
 kiCDdvSWIevVT+EtT/liKeMh0GZDsuGhF1d77MS2csp1gTDnGLkktxck15tdfCoYAvHx
 jEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758912375; x=1759517175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99NoFsVWszwLzL0dGnY2jV/Q+uR4we2DXyveOu+4Occ=;
 b=o1UkjlThfBBa6iqTcfljFb4ECDZ7ry9X37WSrvdGacUrcFMTCKh1T4yXU1CD4qh1jV
 2SGoyQi+GvXgYA5reTT1HAS26eGjZG02VFDdi+iujoG/ti6dLkR9kKHqLrX9Rr43JAuZ
 GsjZgkLcprUdj0OgvHgTOvDeWAaZ8e8U0VCfEQTOYrseEFyEC6VtyrbO9UX7KJ8+EuN/
 eCec/Ro1iFYUprvxUjB9gn65hqG54w0aUXCHDIUigk3y+OZkk4W+Ts7xCsmvX5YadzeJ
 6IaYFTP/opvDlh/HcUzTeO6tOOaNCnzGymcVQwgGcjAfPlV3ypL0EFiuM65hE6BqjK1v
 BF7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoLrRcEXy0pwKiUb+k52RUblEZo10ezngHZIK2/p+2H4z9UKJ4oe3P6cG0FNBVGaskIpVrTDLm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP3baECSRF8k1sFrhfDz/cQasQzv7KwFUIIUFtYS0p7XKHOVA0
 u4oshgZvzUt0RpmDlm3jnRPnNWNSAebv5mhsYQ7fk1s85lNHhTpRe1DyOZ72wXJ0lJhIk7ZilGN
 Ac7UwrdGAiSBJbZTVr6v387dVlKvQk68=
X-Gm-Gg: ASbGncsjRQYpSPXwI0ZTxcSo/uVg+zphIfPVoBCQFfzqlyVddfm0J1K12yrjj7YFsLZ
 C8LhNJpbtn82yc/NWUVeCa6gF/dgThBAf2dFXqc1ZJMgHR0pg0CxwtzjpKRtGIS8H2ksw6nGQ2N
 xmxg4B83oYIkk3fOjgLZOtnJZx7GognQ32MDZvnVYlJpDBqJZtkNd/MlCyf/JOVBoR/h1ACIuu4
 CSBox6PWgpdv4bI8pzotyNY7d2ST3dOaag0mebG/IadtFo2VF4qVCNi6H+vrd219AxWLjyIq2AE
 1uWs3ohzlpo9zoKMY7FWlCGChQ==
X-Google-Smtp-Source: AGHT+IGICCMscDDR09yJt5H0iPKTO2HVhFlo2/cy7JDDWeiBMU3GNUjCo5LwRgqW0USPT3MDqhixj3g/rTT4Pi3J0GM=
X-Received: by 2002:a17:902:d508:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-27ed5b0a538mr51481475ad.0.1758912374667; Fri, 26 Sep 2025
 11:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
 <111409f1-33cd-4cd1-b3fd-e38402a82c9f@sirena.org.uk>
In-Reply-To: <111409f1-33cd-4cd1-b3fd-e38402a82c9f@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Sep 2025 20:46:02 +0200
X-Gm-Features: AS18NWDpMwmpfdQtAlAM5mfbOpZzjcwdG8Vuf5peZ5dotzDbBFdbC1UDMcnVE7M
Message-ID: <CANiq72kNr32NKHGn=gfH52C5VLr9S0Xk0HNzroPqYhx4GngkXA@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
To: Mark Brown <broonie@debian.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
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

On Thu, Sep 25, 2025 at 4:01=E2=80=AFPM Mark Brown <broonie@debian.org> wro=
te:
>
> Given that we're almost at the merge window isn't it likely that these
> will get applied once the current rust tree is in mainline?

Yeah, I am submitting the PR to Linus very soon anyway.

Cheers,
Miguel
