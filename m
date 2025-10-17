Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0327BE8D28
	for <lists+nouveau@lfdr.de>; Fri, 17 Oct 2025 15:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E110EBF1;
	Fri, 17 Oct 2025 13:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FxZd7vo7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1600E10EBF2
 for <nouveau@lists.freedesktop.org>; Fri, 17 Oct 2025 13:24:42 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b3cb0f2b217so270654966b.2
 for <nouveau@lists.freedesktop.org>; Fri, 17 Oct 2025 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760707481; x=1761312281;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
 b=FxZd7vo7OwNZNcQKxgJKSioAARPw7kCIuOBKkRU44rp+jODJChAXgHEgKM4fExBXyd
 A3e3Q1gmtxouec15A86kQt8f1n7ob4SMxl5kwfgNbTozrw1cCGLQGeRuWhxGHPp3IGOG
 Ny6toNkUtg5Wb9GMiGVIJs0akKlJ3+OSov3v/hztDbnRMHbqomoYjp1ga+BOmVOpI53m
 23fS5BZu5obYuqO2Im/Pa9zZyI3MaAwGKGM9mvCLmT0kKohrLpSnGeJtT7q9r7gZCBo1
 RIj8oTt93c3SCRDZ+NLfG/3QOlUtoY1a8CrtNea7yWHVwYs9jRwlKtK3YuR5GAksDeA3
 3kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707481; x=1761312281;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAPzxmZAKRETv1aAgqTv/3Qe7/Q8DRU161MvWKOur7I=;
 b=wwvXSDb1ogaJtBMMUE5ChEkGrrd5aqtG+MuKpqukoLHxv1WXm8uxzXtCfpkb6//dgq
 JI7EnpMBAvdfqE+kBu3BKDerYhBk3JUkelEGmPUah6qXEKzALb9bjA7v4P64yOsLfciv
 4KYo4DbH0Q5H2fSdZinWgyuZkWsgc05v9nGsmw3Gzfskb2H3g0GY1tLuk7f1XmIbTyUu
 DlHar2RexAVKaCYY+i6ylSDXe7sPsGjDG4BiPkn51Tk4AvFikgHUCMoRseB/Ngzyw8f1
 cWxb0r5TO/YvRtX0/zWZHOWSDmVG45b1vY9KSgG7Bi9ff1SiKRdXGcvlSkz1aeBvMUvG
 Bu9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe7qq3p+ZPsGHbshjILYSb+DThBOJ97xqlQqIGtwOeJULhzNSWZCdpgtOdCTYk3HL1dEDHQtVl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1+ZMGt6fEVL6raT/cxzUFw54wA4Bp0CernusbbSFcnssuuspF
 Nrb8gQ2VrbnmO6T+wx+qw+20rz0TxfSug5pQGORlsG6XEY3ba60Oquf8mPHqk5SvnK46edAbQgo
 Jr6AJqtVAvb8naPcAGQ==
X-Google-Smtp-Source: AGHT+IG+iL14vecShPyktC8BwMaW/uSlauMbjVXn7jXOXVhUbEdp41zM5x6FEcncWa9dDOidM50s71O00B81dbI=
X-Received: from ejap10.prod.google.com ([2002:a17:906:228a:b0:b47:8176:fd79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e85:b0:b3a:7af8:c4a2 with SMTP id
 a640c23a62f3a-b6472b5f826mr440021066b.10.1760707476223; 
 Fri, 17 Oct 2025 06:24:36 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:24:35 +0000
In-Reply-To: <20251016210955.2813186-6-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-6-lyude@redhat.com>
Message-ID: <aPJDk2mEAOWoyZC7@google.com>
Subject: Re: [PATCH v4 5/9] rust: gem: Introduce DriverObject::Args
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>, 
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
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

On Thu, Oct 16, 2025 at 05:08:18PM -0400, Lyude Paul wrote:
> This is an associated type that may be used in order to specify a data-type
> to pass to gem objects when construction them, allowing for drivers to more
> easily initialize their private-data for gem objects.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
