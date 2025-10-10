Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AAACBADA3
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A149010EB80;
	Sat, 13 Dec 2025 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncruGe7p";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160F10EC01
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 13:04:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27ec3db6131so3891465ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 06:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760101489; x=1760706289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZsy0sd/tS20msY1KlPWxCXhCRLHUme+WfSUdIbiGeU=;
 b=ncruGe7pQoqS4pnvHaViuPzHimW1vW00ah8lVqxYqBULddIPGhO77Eb/uy01+jb0nQ
 tPTpBawiSiGdVlZdsKlFINFCVL1PPkZKgHFCUqNVmCq+s6ljX8cdJeoFwIqe6fA+IzUB
 7OVRmXoNYfwYCRH5M2LNT66kk1MXPIZmy977rk4a7YF98gOfBqTWOIvyc3Q4Gag9FSXe
 ZjC1A/hMVOvX9scomFSAs8c9O4d9nk44EYVxNWgwautu7uLYkLsEUrqKvnvjT8gMxD/x
 Hgs/mTsvUyi1FXTrxewe+k2mDrtz+gVYzMGE6layrrDGxfS3Ost202V+TXn4Gc4gmz8a
 WjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760101489; x=1760706289;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZsy0sd/tS20msY1KlPWxCXhCRLHUme+WfSUdIbiGeU=;
 b=gvGMiK8YatTMeo6NLF5sr4TYKJ2Vm6rPhEGlMZGDMEonIKAxmqU6bKCrrO789RW4yY
 3OgZZjiVvRgoOD8yK3sDpWBb4htMuRLnp5Fa2uEaKq6kA6mgDMtSsWebTG+LARmflixq
 AgJzc0aHfrxXalso2sv2LOvyO9HH8Ez0Boq+MbZuioKSFg69gwAlyDVnezSOXHQnV8dR
 HswiQ/dp72bv908cViyD22e2r2XMfoPIajGjRcPHIO+UdDjHc0WsK9jGhysWg4MwbDK4
 CtVcf8Kor2tTZckSe9JsbnDGzRq+ztZ2s4Mq9qRybjQS31jO03wxhMeouNAYA8nfZ0fY
 XN5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXex81P4KLdjVTbFyTCL+fwdmSsRjx0KoT79ht4qAUf9NBHHmWGMrSMbrrpE9UWpcvVSAqvjzH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGYQjcs8a0Piagfs3pbMX9sBAXmeoU5StlKTgOlxX7TpmHbQ0Z
 3WTr01/fzUPS/6PRdmoSJLP7djd0GPG1fEA+XKnYL0aSach82Pn8rJbAGuz/NcwMgKGmKlvxp84
 1ifMQAkUNFkAszQ8yv04j8h+6oMSrDC4=
X-Gm-Gg: ASbGncutgBA9oo8m58HNjxM14/zFcYaOiE80WRwn1eBtGgPDRxVnZNBJC5O46JZYRhU
 8rCN7lva4Qp1yPXox0vrk0l8kYrP8C/QK2qyV1RDm7jfssVKfJ8s/OEAOkhzq6DqSYO5NIhRNmP
 XqjF5/JI2W92SJxYiuFGmt+o+yE2UkNEz2IEqOlZ07rwQd/8eoBZU2DDJTVB3ftezw+aHeu77sK
 vHdobSunopNLxUmyL3gOusd966vpXrK9jDLkOP8imUdEPsB2DQGqXRu4WSajNX/ttSAqRiQVXwD
 SRZFP835na0eYEtkLMJWvGmmw8O4KCD1jseXpdS/CjmD
X-Google-Smtp-Source: AGHT+IHctbYyDSdEesc3Os/a9pgB+AQdDwE+Ntk73IR/L6Vt/U6ucoy8bCnQDqUIyz26++WUnRY9zE90ykw9QTMNvXM=
X-Received: by 2002:a17:903:2342:b0:275:c066:33dd with SMTP id
 d9443c01a7336-2902745bef8mr75368735ad.10.1760101489019; Fri, 10 Oct 2025
 06:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
 <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
In-Reply-To: <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 15:04:35 +0200
X-Gm-Features: AS18NWACc6jJI62ULqH_q_jHKtWGfejkpxt52RfXiBIGzY9GSvEv_f9PahKrFhg
Message-ID: <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, 
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

On Fri, Oct 10, 2025 at 12:08=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> That said, it becomes a bit trickier when dealing with conversions
> between signed and unsigned types, particularly when `u128` and `i128`
> are involved. For example:

Yeah, it is why I said it was a dummy unsigned case -- I didn't mean
that single comparison would work for all cases.

But what case do you think we cannot assert? We can always take the
discriminant and reject whatever inputs (e.g. ranges) we decide, no?
And we know what type we are going into, so we can always decide what
the values to check will be, i.e. we could in principle even support
infallible conversions of the discriminant to other types like, say,
the bounded integers or powers of two.

Maybe the issue is in what you say at "the discriminant value
interpreted as the target type" -- I am not sure what you mean by
"interpreted", i.e. I would think of this as accepting only some bit
patterns, i.e. working with in the discriminant space, not the target
type one.

I may be missing something, but in any case, at the end of the day,
within a proc macro "everything" should be possible one way or another
-- even if we had to inspect manually the literals :) And it seems
worth to remove the pitfall.

If really needed, we can always drop support for certain combinations.
We already do, in the sense that we don't cover every single other
type out there, like the ones I mention above, e.g. `Alignment`. But,
just in case, I assume with that approach you mean skipping some
combinations early (the ones that cannot be checked) and then still
asserting the discriminants, right? Otherwise the caveat is still
there.

Thanks!

Cheers,
Miguel
