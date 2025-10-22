Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BFBF9A14
	for <lists+nouveau@lfdr.de>; Wed, 22 Oct 2025 03:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FCB10E35B;
	Wed, 22 Oct 2025 01:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwPTvd7L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D423B10E35B
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 01:44:02 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-796f9a8a088so5657363b3a.1
 for <nouveau@lists.freedesktop.org>; Tue, 21 Oct 2025 18:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761097442; x=1761702242; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S9onf5CBmbSk29wszlhfpjcFikIXhbvWOl4PnOQkDlo=;
 b=QwPTvd7LisXYt3pV28Yv81gnIIYQtGBM7hM1V7G8sSYpf5PuDbLqHgzJTI+YRNzGkp
 DZgh+It+HuJ1TNETrDdVjtbC0+an1TAf/TxCpsBFRWfuf4SXJUQEA6q8/4EJZlIAtkLo
 AImTu/zX0hd4qCEfaDWqpBa+lfskYXu256+FNnoTReYZV+DF6Lc7Ax6I4xbGmXNPXLl1
 LXYviGQQ3l+kd3tkK2p+K/RkbDV6h3EvGM7q9L4uhhMyV3X2zR520zKI21YdzoieT7oO
 OrE2iKU3DvIibEYFB39/gOzp9E5xMwUHAWIUuJwH78OQJcE3wXl20xGvBLwaUz+ZViQs
 FlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761097442; x=1761702242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9onf5CBmbSk29wszlhfpjcFikIXhbvWOl4PnOQkDlo=;
 b=f9R3NMupXmwzwq6d6rJUSuHYFoZElWHHAga7qqWBcoWn+PW49WhHcUljp+HRfCgfvQ
 F8LV6P2TGVGHWe2ctc5oKHRzL6wcz4xIgH49TqQ38Ofuslpri1Rtg5rO4XRALtKIW6lP
 h5I2YogzxJ6dLLEHs2Wr9Gv5lmzycUIqS1PVhwfmwxtI1GyD/8QVtz9bqdqeJ1H8sSYM
 633N0HWNJQlibsmth0q99rRMjc2Qzluhxvx6k/hL4cTfBr7eryCS88yTYWLRXjfigQ8K
 r7NAny4o8HtSzwr9/gz9rMamFaHmhnkckXL5y52TVwPHqsMXKzroeuSiuC0eT14DsMY6
 oQSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdj4ml3GB8mTZS5Fa5eMM1sdz3Fl4Lh2EYopNsrta7EqPwHmsr1Aedp5YYAyxz8Vt05twTWGcG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcsbITO0xfPQESxc+5y7u3QuGQKLohYDVzE1I2TdSCam7o4+m0
 KsR4TY29uTJ2t5Ds/jnlnDcWv1UQlhW+FVO2fq+RnxdmypZpUEOccH02RfiBpXFv
X-Gm-Gg: ASbGncuSOHcXHqzsXsoqDiMUrKr2jwa+SMUs6eDKlZ5oPOMKu7Vt4kD/vbku/138LYE
 DHEvMd76md/9j7geMT25limeCyrDyM1bWgWZ/pRYLFyrG+Fzj80l1pXOT7wtbC5ub9rZzePwOkv
 /reeTeGuxJxUCzrbpTTXsmv8Rd+ofW8T6R5AROgxngbvOjFi9VbyYuinD7HKikIvNja2tv4h4kh
 2XJ77Z8Z9m1Y6U9ZMdEgFocfSgQbKkRu4JvXXX4b1wrZPYHaa+GA/cUyZAipDXF4uwZ/lY7hu59
 Z5EgYkOhbrCPNrRwIXYayRPoTk/v30UYY5ZJ88EAnfXr1N2aKKiBVXeTe6MZQlvdwI+ls+RAqt2
 aAX72gkkHStllDHnIk7nVsybXy8eHRBAipnr3gCWiz9o08Q56OZ92XigAZv9njNfIXi8GHNDrFz
 +khGU/NbNf0wmM
X-Google-Smtp-Source: AGHT+IHulmK78/tDjF6qU3+kx2KCP7ODYLsRFIvylR8jvaOVGxcaG7BUiBMgRTf0SD5dvUFXuEiNXg==
X-Received: by 2002:a05:6a20:5493:b0:334:84f7:5646 with SMTP id
 adf61e73a8af0-334a8650262mr27706829637.58.1761097442076; 
 Tue, 21 Oct 2025 18:44:02 -0700 (PDT)
Received: from archie.me ([103.124.138.80]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2301211besm12631232b3a.68.2025.10.21.18.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 18:44:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id DA1874209E4B; Wed, 22 Oct 2025 08:43:57 +0700 (WIB)
Date: Wed, 22 Oct 2025 08:43:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 3/7] docs: gpu: nova-core: Document GSP RPC message queue
 architecture
Message-ID: <aPg23d8wF6iVaWmv@archie.me>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-4-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iAC4hEmvDvNxfLM9"
Content-Disposition: inline
In-Reply-To: <20251020185539.49986-4-joelagnelf@nvidia.com>
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


--iAC4hEmvDvNxfLM9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:35PM -0400, Joel Fernandes wrote:
> +The split read/write pointer design allows bidirectional communication b=
etween the
> +CPU and GSP without synchronization (if it were a shared queue), for exa=
mple, the
                                        as if it is
> +following diagram illustrates pointer updates, when CPU sends message to=
 GSP::
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--iAC4hEmvDvNxfLM9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg22QAKCRD2uYlJVVFO
o7HnAP4u7KGRLbe+oCN/YmXK+pEcCGjInjoec1YU6PfZzmPKqQD9E7LICAzFtTAr
gFlcqzOanE9DrhfypJiAcTm9yVs4rA0=
=gCXr
-----END PGP SIGNATURE-----

--iAC4hEmvDvNxfLM9--
