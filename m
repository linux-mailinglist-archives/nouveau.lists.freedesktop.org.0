Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD9CBABA7
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2710EB01;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr4gAB5n";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893D510E640
 for <nouveau@lists.freedesktop.org>; Tue, 11 Nov 2025 19:54:30 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-29800ac4ef3so147245ad.1
 for <nouveau@lists.freedesktop.org>; Tue, 11 Nov 2025 11:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762890870; x=1763495670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
 b=Mr4gAB5n2v/F+Y/lj4ZF/mfKu13Ilbz2CRLjMfHXt6/iSYNrZnUUv+R8Hp4lVUaZ4C
 9cgDnq287WJaK71bI7nGMhMJyrooUzgTv2Cwl/SnOlToAlyKxRJY29DOdaVY+ULa+GcB
 BbjmrAGC2b0Y0vDLE89o4JdjjOgAjdUU41t37hHJprVg2pAb1MG8DRbTl1d0zDF/efTX
 UqC4W7c8FuYmp53vnVm/iTaPqal2v5gglgCO20OytjE+6u6cRWPBz9t0RFH+FCjkt+8x
 6JedUVjo1e/CA1OfuA1/dnn6y2CjlvcERuhNxSFfejXaHz5gqkzFxbBeq1h/Hrk0H6Z0
 5vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762890870; x=1763495670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9+a/eFiDoDkgzy9Ul2SUezw6cD2/LMwGt4BI4jMuWE=;
 b=ic6QO8tQVRcxITI0QBOO9z/NoAne3TdMZbTdyaEjwjMBu8sDe/m/2hfMZ2VowIGa/C
 gyeM4eKWkVAi73jpuK8PFmKiVKiPAvZmrYN7LOi4fl+nzASy+KkVH92czgOySo+TcB70
 3gduSR8ceJPkrxsvdh6W81dkDvPJLBz2A4Qwf4jrM9k7nmq7yMaovQ7tEsFpTe3YL0a+
 9Hro7gtGjsP54W/UHoNvyv6wN++tcvXYAC0Hb/GJi5nsHzWgkS7PV+kn1Eh7OhbBpfhA
 3T1zpC5gjhuLWCzSAJxxGegnnrITN8v4BpJiw6Kf6RQXnjU1tplzURIYsHdxTgcx6wu4
 xGLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqCBQlXcZfxbjUCgeA49BZXzk5xi6oLDLQLNgvcSi4hcoxkgk8kjZ9GL+jLKfz/8NN5gcd7oXd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgMCas4USC3qU4wCUo0RgLZTlLtRKjgsuHFT8J5D5nXDR1uV10
 0H8sJqcJUqo2uGQ1be7AxpJ7gR4b0a5ejxiKFCoH9OHNtpIR9r4z2u9rbN7R13nNzLxDumTJ+Tj
 LX80cHuWInBQyGJu7x7f1GJ2SHWVTp10z2aQN
X-Gm-Gg: ASbGncsZ9aN1651aE5Xv2c1HV7svf+9//Nst62X63U2rVVpu3VPqW4dW6/SZnEWpkrQ
 wzF6cHnqEdoK+NIoFQZq/fjfBq6Mb5JyVoFsCCJyEFiFmIZ8ogrKxCfIWUce/tR00oB7RQkZZhW
 eTMZ6mDx9PTZQ2sgGrWNtdgkYxVVPgyAvxc0O3wz0i3pAp912jrH/m4VP/kcIMx62jXpEnldKMd
 VkhoDmHqENUpf+LcF5p6a9vMX79JKCNKJFN2NVnv4+R7my6wDLAfuLxWQGxjCQS+SQXwLnDrLoo
 bb/6PsDoW2TT2flM7niejAKaHK0vZt+tzMYOgpF1QoU55wxbPkmXaBDrbUlz8XtL4ZTnf3ccSvO
 6QeQ=
X-Google-Smtp-Source: AGHT+IFGIw0sPldyd+rtRft0su885bkTxqqUTUuhpd3lcLBUxXPnk/ZZeeLUF53/y6iwwN8RrfJVa1Wt8ImxuyYODE8=
X-Received: by 2002:a17:902:d50f:b0:298:371:94f1 with SMTP id
 d9443c01a7336-2984ed2b38amr3798265ad.1.1762890870059; Tue, 11 Nov 2025
 11:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-4-joelagnelf@nvidia.com>
In-Reply-To: <20251111171315.2196103-4-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 20:54:17 +0100
X-Gm-Features: AWmQ_bl0L-0Cea_Wx26TMHEqrDOWgYHY0NBpoDZ7Qy4Vo4Y76uHd2eVw2Y9spcU
Message-ID: <CANiq72nuHUFGMsEYr-KhCB4oMjX72YskG0s7uCB8dcVtTGW-jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: Introduce support for C linked list
 interfacing
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com, 
 acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 jhubbard@nvidia.com, ttabi@nvidia.com, joel@joelfernandes.org, 
 elle@weathered-steel.dev, daniel.almeida@collabora.com, arighi@nvidia.com, 
 phasta@kernel.org, nouveau@lists.freedesktop.org
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

On Tue, Nov 11, 2025 at 6:13=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> there. I rebased the patches on linux-next. I can also add MAINTAINER ent=
ries
> in a future version, if folks agree this should have its own MAINTAINER
> record.

Yes, it sounds good to me to add one. Please do -- thanks!

Cheers,
Miguel
