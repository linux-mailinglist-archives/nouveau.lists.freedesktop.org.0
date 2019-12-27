Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656CA12B4DA
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 14:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D66E43C;
	Fri, 27 Dec 2019 13:30:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E4D6E43C
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 13:30:15 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id 59so9052533uap.12
 for <nouveau@lists.freedesktop.org>; Fri, 27 Dec 2019 05:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uL5bPGr1/xPpwmfePLmi+XPi7cR8qhxOFLqggwqhKwA=;
 b=HmGR8183libgHn+R1ft/hcqLezhH/IL7MHC2EzdXQjvkq9nB6QtWIqw+LMDCowVXBK
 CqQdmMEHT2ZZLwFzrORopfE/wF+SsOhH2IjMsixhAsoSjruO7IQBXsBYE2kqOFZoXAhp
 nCAT4nsV8aIYlX3Ze0gnds9ZBVaAyDEtU650u4iSkTrOgr7r8PDeFV2EAPJXM8MgVOgd
 oZ1OL6fXFkXQJdFHZIlWYySoL2r4pufj6msxKgGgiKJEjEbNLiZdWtbkw6tEGxjr7s/i
 wYW3yXVkh7h+xBF4VFeiFV9qbF3+OFYKT8tVK3jToAUDAdbL+7e1tqTMIJ4J/1hEAg30
 9xIQ==
X-Gm-Message-State: APjAAAUunhDdxN25j0bu37Knb6P6r9rR5kzZ9BJSy1hB5fHlTTKCclF+
 YvTwb+oZW2yFQ4CgLvm4D4aEWXXnIUDbAnpYFfw=
X-Google-Smtp-Source: APXvYqyi+RlSjfDwhJ59TjZZa3F13qSzf8GBuo5jRWlrKISODDEW2/9sJU4Ywcz0nuGGj6VuBClxQwAvfX4spe4nC68=
X-Received: by 2002:ab0:266:: with SMTP id 93mr30315588uas.58.1577453415001;
 Fri, 27 Dec 2019 05:30:15 -0800 (PST)
MIME-Version: 1.0
References: <CAPm7QYwHte2HzRWGS--BLGvh8aT8EFnc=145KgChFOVuKR5DOg@mail.gmail.com>
In-Reply-To: <CAPm7QYwHte2HzRWGS--BLGvh8aT8EFnc=145KgChFOVuKR5DOg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 27 Dec 2019 08:30:03 -0500
Message-ID: <CAKb7Uvjdt6ypoK3O-HNGYr=Xn9CcU7p5k-dqvu4OAFyUJkqYcg@mail.gmail.com>
To: Jerry Sanders <dragonspark30@gmail.com>
Subject: Re: [Nouveau] Support for older GPU
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Nouveau should work largely OK, although the Tesla series (to which
your card belongs) has some unfortunate random hang issues due to what
we suspect is an incorrect FIFO channel switch procedure.

Support should already exist in any linux distro, so as long as you
don't do anything to proactively disable that support, it should work
out of the box. You can try with a live cd or something if you don't
want to commit.

Cheers,

  -ilia

On Fri, Dec 27, 2019 at 3:13 AM Jerry Sanders <dragonspark30@gmail.com> wrote:
>
> Hello, Name's Jerry. I have GeForce 8500 GT on my computer and I found out that Nvidia does not support my GPU anymore for linux. I wanted to ask you several questions.
> 1. Will your team support  drivers for old GPUs  on new Linux distros?
> 2. How can I make a driver work on a kernel that is not meant to work on?
> 3. Can I somehow solve this problem without updating my card, which i can't do due to lack or cash.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
