Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD5CBACD9
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B9C10EAA4;
	Sat, 13 Dec 2025 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iysq2aAO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5D10E346
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 19:22:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29094f23eedso1633625ad.0
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760642548; x=1761247348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
 b=Iysq2aAO8o7hf6m4+gG9HK4rhSyfv2uq69jLxvMAwi1GtLn8seXdWuL9VGfGvZEyLJ
 Lu45t9QbglWMmgI53v+ePdCz3uqoNycqne9RnkOf4JYKG3kj1VRR2b0IqWLjKfmHi1DZ
 bkAEuQzuGk/DXvU5i7jxDOrf3/MCbcoEaOnr3kx9qoSH8WYtoaI/7yZv65Wb3DohE4hm
 AQLEAjLeD8Lz1fFaWv5nqQX05sxJbrrQsbWVgctYMmHHNqn9Udxug2qJAnC0WJzRRgTz
 FGRptGuv5q+X8KIaWjbtC1JyILtnWJmEswxkk+M8pb4nvEcC0lIawNOnNzXOTQMQd96+
 AT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760642548; x=1761247348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBABBnxn8fN9AsR0d75e1hIi7H9rcgMvSSTa+zi6yEc=;
 b=UMCYV8yQw0vhC/Bg9HhJ6/8i+tunjykJl26JKWF5BQfSfkDKQDr99Jy2jsgpncdUG4
 yYGXGeC9r+8ecu1Fxj52Eq64a/9TVBEF4Uk5jBLHlJ0oBnlbr6rRg1GwJgPpum2vckmK
 y6yMH0tTBdnhvNybr8/MwVmPuyTQpW2YMxX5E74G12bYTYFei1DIY2sKOboG6sp72fA6
 nG1o0sIf193Hi4V+SC4uQY1OErbM7mE4Ah6+eDBh5qEnoCTdrXbGykMZXVQiQWAroGPx
 GtOk5nA2MVasuq865hk0cQrzohdIZ+5/GDsd0mRpL1ERBCiEjVDNmlt0Re3IBXWtWzj7
 rqIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNUQYarDIi6LkTtXYUB9RD79x9nuuSh04l37KqmSA8aVAM0A3LgVGdr74JEIoR+XMVB0sVNK1e@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzx087wJjcDYAHw/upWqK8aVQqQdVdFBA/RTs7X61v1mRc8N2P
 QUb4ok00i/C6kQsddZXm02xeSFksN9kr2MVSdUJQznDPxAPNjF5JVnvGGcUr1PG+bzkepPEgyWz
 k3+2OKpq6Ot/pvxGjT+7gyfJRn9U6UKs=
X-Gm-Gg: ASbGnctWCPimVC3UVQ1v7UPokZTVaPY5YVHkFN7v+9Rswcb2zAmkqp8Tw17rzcwLO0D
 C6lJHlJoDPFnZGOqOOurhRVD0/o5+t1QtI6/nej1gwaXHKLMJBjHaEbp7mrCES0sc7GoJ7CkpyB
 eWfioKCI4MhwnNvio42a3nEaZw9z948kcSVrsz+Vsvmt5N16yvPSezRq+txt9Rk4/sTZlcbsFi5
 tNxHIkcAyXgymq/9RoPGJRu7Ym8kGl7dHtqVE1bkZ7u8oh1ZMwJbyuE43bWa3SNdQUDKkoMtmB7
 u9pGh4FOAngCpaknLW8ITHSrUmXyhfDGM60eC5oglmpnulju9ykfMXhSB8lHmloj8HK0N1HzGhO
 r5ZvAILrQha8QJQ==
X-Google-Smtp-Source: AGHT+IHjy8KjEMzI/k73gqsgnhmTui+XTn/RvV7qTycBPo1XmiJr5yhiR0piRHANoQ1JkvBfjCgn9II2uzdLiDAifMg=
X-Received: by 2002:a17:902:eccd:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-290ccf29388mr7338615ad.0.1760642547522; Thu, 16 Oct 2025
 12:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-7-apopple@nvidia.com>
 <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
In-Reply-To: <DDJJ4Y320YEC.O6QIUDDLFVOH@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:22:15 +0200
X-Gm-Features: AS18NWDEkVfvPPz-PXmo2P-iezhkJ_4yR77lvhxdIOXjaj9vZ-OB3fMu7gnX7yo
Message-ID: <CANiq72kWof2RL93s5L7t52ax+G65iBrOnfMa3XrqC+LgSO49=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] gpu: nova-core: Add GSP command queue bindings
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Thu, Oct 16, 2025 at 8:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> There are lots of unused warnings when building on this commit. I know
> we don't like big patches, but since this is semantically related to the
> next one and the two touch different files anyway, how about merging
> them? IMHO this is preferable to adding lots of `#[expect(unused)]` that
> we are going to remove right after.
>
> If you have been told to split in a previous version, let's just add a
> the `#[expect(unused)]`  where needed.

A possible middle-ground is to add the `expect` in a "more global"
position, e.g. at the top, so that it is a single line change. I think
that is fine as long as it is removed right after.

Thanks!

Cheers,
Miguel
