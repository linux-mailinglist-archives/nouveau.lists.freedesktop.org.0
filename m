Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CADCBAF61
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559C510EC8F;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="LttzFiya";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D900210E23A
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 19:19:54 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-339d7c401d8so231325a91.2
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 12:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760037594; x=1760642394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcXwgJGTpWZU2t3OdSFiom5bqnzub6a4TGqV+K3Njdc=;
 b=LttzFiyaqJMC47q/A0XafUZwvmvoVFQaCos9WLkmtf/RlndvzxUN59XW5lAveA/a3G
 Y8uKNSV7/BmE47lzgRI9V2RPkS8Oy+HYhhnyM2Kd2z11xO47UVISQO9J8UaKDdplqlBm
 D46fJvZotl+U5+s9lWDQJXW2qFHeD6ypDZNWxLlLOZG/VVnkfelNzo8fiHYt/mc4LvPe
 UieOf3QH07svyEObdpvpW55ijx97eLOJM86Piw0syde1Inf6KiPt3L+Mz5BXMMlVB+l+
 j48UxClS77xPdGxLC9rQo9WrsWc9x/HrcL6E/MvL6Ei00CGBOrmGs9SsigSrWPnAfEyA
 bfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760037594; x=1760642394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcXwgJGTpWZU2t3OdSFiom5bqnzub6a4TGqV+K3Njdc=;
 b=B0StLiDyP7Ibo1x8AtWTOVOAhMU07y4cOQQDN8OvznazGoM/Z3n62IRwrGRvzge+IJ
 gPlDbaz8CyXPzdWqmjwhTgTwtIIzXwmjHJFxKP1ikpubP/GeB/+ZjrXopudldl+xE5AS
 7eSe0pxTDQ5fMN2jbohTdZxw9kqw/BtO+C0WE+m03SqEQeA9jGMUUxQR136G9DNKihdi
 Lnl57roBvcbhGUhmWdnymvNKWvJDYbf1b8YfnxUQMTVZjL207H44uuc4udu+bu2G3hlb
 Jh8rr2FvmOyN4Y/pbv3EX9J1+nZZNUc3zjj/HBf9L11kdHphG4jo3H3+KnHAFtdqnV4K
 QM8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA/4dnexe4+slRbJ92SJMlkIbSClMaBoDlBaeVfpM/JMG/bNPo8/Ca8UC5UD6e+dPk8bPRMUgO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBQXj90zkiIidD+9t9pkRC09P1TDPO91SgHvD0AYrkMJZEzQjq
 60d/iZpV3G1g/LiWn3sz7DBGCXjHx+ogsEqDmaz9lSF56wJCqzEUKuo2HGqSyE8YHD9WTkRg4/e
 frcX7prKxQd27h8HsVaWDTF9Dti4OvpQ=
X-Gm-Gg: ASbGncuhKey6FxAWX/lB+G+REos1P11FQSj8chUg4qHpzu/mek0sBDg+cnVXzfrTHqe
 T9RqhHLVIQ7WWU0sSAUj177mA2qcU0hx0z+9pBTZmSccDy5K+MAaM902PeO4XDJmqWSVD6ayoXs
 JNKkzUhzODRemxRThc1SQo2KwC1mp7mqr3/0DhIPRDmNGpoFUgpRhGpbPz5/3SfHfxNEzIQFX9J
 4+PFP3GmtLRVZ690uZptj0p8wB9bjM6AQrESN5Ar/44JkxfPaIs4uiIT6G+I3TEpMNqDOQqyzMP
 KuZMph7kCd6wKo3PopLt3NkxbpNCeGGAJ37yXRqREgcelLPnww==
X-Google-Smtp-Source: AGHT+IGoblUKEeISrZbv72jxa9PiUckqqLQlj3DZjUWlLcO9V1Ny9+gENsT9PTdE7jTdp3qFnpKB0Hp3UsFuterm8Ys=
X-Received: by 2002:a17:902:d2c9:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-2902724dcb1mr61748135ad.0.1760037594340; Thu, 09 Oct 2025
 12:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com> <aOflmmHe8O6Nx9Hp@yury>
 <DDDYOBOZTF7Q.124VJDF4C76B6@kernel.org> <aOf-s-XuhbN7MUlx@yury>
In-Reply-To: <aOf-s-XuhbN7MUlx@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Oct 2025 21:19:42 +0200
X-Gm-Features: AS18NWAcMteSg_vVIc0g1AxzGZB7uiQHfY0qKY6Biz_FAtZhjrTWuqxAC8PWrD4
Message-ID: <CANiq72n7i7mpP3SXnY_opUKAm=UjOne=kECc4QdyXo4gz0qWVA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
To: Yury Norov <yury.norov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Thu, Oct 9, 2025 at 8:28=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Up to you guys. But having in mind that C is the only language that
> really works for system engineering, I would rather consider to stay
> in line with it on semantic level.
>
> If your goal is to make rust adopted by system engineers, you may
> want to make your language somewhat familiar to what people already
> know.

I am not sure what you mean here, but just to clarify: our goal is to
improve Linux with Rust, not to increase its adoption (even if
obviously many of us would like that). And just in case, it is not
"our" language either -- most of us do not come from upstream Rust.

In general, we do try to make things as familiar as possible, but
sometimes it doesn't make much sense, so we don't follow C blindly.

For instance, C23 also got checked integer arithmetic macros, but that
doesn't mean we should start using names like `ckd_add`, returning
booleans and, worse, using macros for those. C23 also got `nullptr_t`
-- similar story.

Cheers,
Miguel
