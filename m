Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE13CBAE2A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8110EBC1;
	Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU07FPJm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB510E59C
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 09:57:53 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7b8ba3c8ca1so885860b3a.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764151073; x=1764755873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mHQ1VRdjTsfmUz5G2DWe71KnbFXKlmtSzGNdzBPt3M=;
 b=XU07FPJm0JEFrlRMraqSrzXkgdbTRbiuLjoBniTj4s2V/oyqaGVI4ETu2+TOZW5vM1
 MGgkshy5b17640Jbxrhi8+uWEEX4HM+NdFXubeJYwpQbrGKgBdvMCbK2TzPQz28NkdEz
 +CLS13pKXTEk4r9sm04FY31igp6CsTrvlvmma6HoLClZesUZxNargxePZaYXqwxphJ7v
 RLT6q9Mq1Gjg/zpLKseEcVnRM0j8c5aUj4iGFl+/CspLXCeuQGUAV8GzlSBYnSEN5cHZ
 r6yvlX6FfXPLA5HItT/RxOyQnDgtS7KBE/5hUotG97GHn/jPL+yUeIU1kEUrSGTnmrm0
 h5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764151073; x=1764755873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7mHQ1VRdjTsfmUz5G2DWe71KnbFXKlmtSzGNdzBPt3M=;
 b=GDcroy4EhCbUx0Nj+ZkvMS4WboYREOdcyc5gzhcz3SP08OTwSvL9w52yQxZAOS1q62
 XMx5ZsDKIy96V4v4w+ptUr08wqPXli038uYwlwM4t9CdviZ1RlIFuP349afXTWrE5PhA
 HsI0DQCWI0ofse442SGj8+9OyJwopz/lnFoB3R4SFXFlFr+rlbpVoHMhbDT5g6SQoIlq
 WfZXohUE69nnvH1ZtGpC9aYFXfZl0LMWmn4imp0nOkjits2O1Gv2UN+yaebjC+ZkKKJH
 Wg/DUfMe4dQDOFBLzcSg1qK4a8hSXpzww9cYDf+nzk+9AzI1LXMHKgBl7Q9140pwpaXL
 JoKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBJ48gjBVH4HPPSI0YJu6uZt1Uuf/oEOWKC82jAfaCjDtI/EFG3gDNcnOvf+7MLpIxYWxK0KX8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6/pcsqp363rxhvQSeI0i+LLZ2b6f+jxMo+4AAdN509208SKLS
 xyIXB7J63vXS1gUEuyDWOmJDp1eXmY4PfNOroVWgTwdccQbiU0r4JSaoH7cP3YAYrzhyGqETPtI
 LFnJu1rqi4x0g7JIlQqxWnycmIr4Ak7o=
X-Gm-Gg: ASbGncv4ppnoj+Cmva4qEaso+rod9cdPKQ9q0Nohw73p5WfxcBlPjA5KHsDW5BSF1b3
 jrqnB+5VMZ+lN6Sx8cbPCsgOlY9Y4xzL5eXo7XjeVW7jBvBpn/PSy97uFJEwvjYLXhH9Kd/XEm1
 d/wVYIZbXUMO8VyWi9CvLvYgfAqBpA2D1ZoYfkabJzilR0vwSykV/7/ei38xgy+i2walOWpZGYv
 XijTqheDewEtRhgCqrT7dh2+l3+nijhxpHNg0eah5JVvaW2KTWya5YipAix1VJmnyuFna/5x/Nw
 0pFc0KcrD0oneIwBOOUOcLGomaGB+YF98di1fHnuYChFaktIMRWAtrpZRvQObOE2pSPmnQenWQG
 c5Ry5CMShfIxlAg==
X-Google-Smtp-Source: AGHT+IFWUJD/OFJsIi7ionp3U86q+wmuQeZBPMs00ZPJQzBu76WJ8YVwfw1gF+sDPGVltKQOGoQnZvvegokGD9/vJig=
X-Received: by 2002:a05:7300:7b01:b0:2a4:3593:2c08 with SMTP id
 5a478bee46e88-2a7249fec39mr7449116eec.1.1764151072733; Wed, 26 Nov 2025
 01:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
 <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
 <054d9c84-4231-4662-8847-4028228cd290@nvidia.com>
 <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
In-Reply-To: <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 10:57:40 +0100
X-Gm-Features: AWmQ_bntZ2P7XIQ-a76ZdHb1powt_8RzB70VcFKn6vPRZzYBlZID5TO9jCwn_OA
Message-ID: <CANiq72mEE7DCPNgJ2FS_c7A9C36GgjkD8G-7nV1oLC9RvSbAjw@mail.gmail.com>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "lyude@redhat.com" <lyude@redhat.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Wed, Nov 26, 2025 at 2:06=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> IIUC Timur's proposal would not require an Option as a field, just that
> the method returns one. I tend to agree that this is more idiomatic.

+1, please avoid encoding "states" within integer types and use the
type system instead.

In fact, where reasonable, please consider defining newtypes around
certain integers uses as well.

Cheers,
Miguel
