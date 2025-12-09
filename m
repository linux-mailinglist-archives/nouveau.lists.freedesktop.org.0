Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E65CBAF13
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA3E10EC5C;
	Sat, 13 Dec 2025 12:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1JCYHAL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AA110E162
 for <nouveau@lists.freedesktop.org>; Tue,  9 Dec 2025 01:09:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-297ea936b39so12930035ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 08 Dec 2025 17:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765242592; x=1765847392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEsBT/pLTbTyK3CEgFpn4Sf1V+J+71IdtUhL88rzZE4=;
 b=U1JCYHALR1ueIltJ0bXr1qqys5hQi8kRX7dMcsDQYFbLwbl9E3bFuhncwukVG6yrt4
 QTS2ErY9RQ1UOxTFcRIxgakAvSP0IW3kyoYuI5dEYQhZ4W38Mx31AZKwfu3WPB7zU+Gr
 IAlLhHKW4BhfrMf6G+3mMkDCN5pCWFnS+ByRN+kSUJqQmlSqcMgs4MqcxMYDzoq5IgpW
 MgB20Jg7gyBSc/xZVNtHxZZ1kIk8BXxviqI6dgDAQ91JSb2q7qu9pwTa0yTyGhFDhPt4
 YTg0tWIWW3ELn3xBuxtUywTwyE9ky4PqdTwQpBqHkawOvDqey+dSbJZPyPqb+qYQNU7E
 2WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765242592; x=1765847392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mEsBT/pLTbTyK3CEgFpn4Sf1V+J+71IdtUhL88rzZE4=;
 b=GRe5VvB8HhOYiJbscyREzVhEpMUHp3Bk7OPehFAX6nhtByecJGFDgeRlkbmXBGhD89
 OOs0ztAqTEHCdKgYKr8JCsivBAy2MNeWg3Amlr5uWTi/2j10a5uc4SnamG/jaxJNeHz2
 mIre73kqBEX+v+sIQaMNM+0EaLGRgLFcUwlQ5x9yzEMcGTB+Y2XDec8Gv1KTMEB0RzLB
 z4oUdPMq836Yv8LY0wGKypOv/nZow5m83NYNK7lI0vdp6tmDW7QiuS+6alrU9KJAdrsT
 CNCs5OOBnBzZQBuULzSOIYZfXqn5oiSo8HUze4MjMtZ9kOSECYE+lqmYtU5T+c1Ztwlh
 Bu0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFuZB+JvYzF5KRT67loYL0tiX2TL99TARqveq+pgxjgLqJUk0FQyulBU0E1Sxl0UhIwFARvdEF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaCQGSy9hfIboG56aAZShi4ozODBlz2KH7DERYDAoMOeFxazSx
 aLjwRFrsx0ePWJ4SdrtkegG7m70ZRkouNUs3tY7NpRVw9fx2O8tdLzNSPSfYP7+gKzpBzr0S5Z6
 z/wHh/Y9wRlEgTV60rE4UHXDJ+K/deWU=
X-Gm-Gg: ASbGnctKcNhxe2SRI5/iLUJx8ycXEizvAGbKNtzIEmNK2WZDo/dgwl56CS3APlaT72q
 FRPj7PjMkR8h31Rd/wVpVfI4muUwqIDMHeIwTdIU93pI+1lD2JVBULvehpnidyNr37D00MAONsp
 DhOv3YQUmo3mpjUoA6FkuZE/wLYjHBsuzoD4PbUPc4OSKiHXMbNKWYQl8+nZ3fccd7U9rTcoCv7
 lBzK8pRXuf4FPXWtkBpWwdHkbIqzZBirqV+bmRTjN7r++YTv2tIlYwaAga06LNaQk1hciF3YRwc
 Lob5yR0xd2oXC7frAMyrfndcC0A1zEvd3TsJOdGrmjCmS63afUy9Onxixtj+HBzTdd+pa1/EG7p
 EJDOfiN5NrOnT
X-Google-Smtp-Source: AGHT+IEJL3H2CdkWL4QxEIdsfYYJgp/HlFqFDJUUsqk1LlVkWGajJj3NrPDAOyq+1dE7luFLpJ2g4+mrjjdZg1vzVG8=
X-Received: by 2002:a05:7300:bc0e:b0:2ab:ca55:b76a with SMTP id
 5a478bee46e88-2abca55b82amr3434532eec.5.1765242591987; Mon, 08 Dec 2025
 17:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-2-zhiw@nvidia.com>
 <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
In-Reply-To: <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 02:09:38 +0100
X-Gm-Features: AQt7F2pwYK4ZIpAGJ2cuBoFunByDKO5gKUgFer_xOdKdqv7XdaFLaTqM1T-H2w8
Message-ID: <CANiq72mkPMwb=3P_-fjObUC8NmY_6pzK5cn41RRwa2zJCazuPA@mail.gmail.com>
Subject: Re: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, airlied@gmail.com, dakr@kernel.org, 
 aliceryhl@google.com, bhelgaas@google.com, kwilczynski@kernel.org, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
 a.hindborg@kernel.org, tmgross@umich.edu, markus.probst@posteo.de, 
 helgaas@kernel.org, cjia@nvidia.com, alex@shazbot.org, smitra@nvidia.com, 
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
 targupta@nvidia.com, acourbot@nvidia.com, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, zhiwang@kernel.org
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

On Sun, Dec 7, 2025 at 9:52=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> wr=
ote:
>
> What's about to do something similar here (and in the 2/7 patch as well)?

In general, using early returns (especially for error and `None`
cases), i.e. keeping the happy path as the unindented/main one,
matches better the usual kernel style.

Whether that is with a simple `if` or `let ... else` etc. it depends
on the case, of course.

Cheers,
Miguel
