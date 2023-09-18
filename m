Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B97A55BB
	for <lists+nouveau@lfdr.de>; Tue, 19 Sep 2023 00:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933D910E353;
	Mon, 18 Sep 2023 22:25:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0388410E353
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 22:25:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so80498481fa.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 15:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695075933; x=1695680733; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PTfnY9uWXPpDma/Afe6XSTglEi0hrKJxPetFRC40P0g=;
 b=DFiZfaoM950HPaGcJDkSfPlWO3K3mVG8rBd7z2R///C4CGKgWSTxjej2KaK1ZeVkGO
 5oOmiSKR1ABoXl4vXF5bVZq6UmBvzynYcFBMjU1VGhu5f6HEc6I/jrcs/N3xoauCVKt3
 utSGpdZfsGXBIp/dFXqHcrIqHaXBrbRC0lsbrluvRTlVSiSF6z6EMZQw52ac7MDdOnet
 Ix0uXDVyIM7CMx14UjwdFZ1q7yLZHARV518iuCoNUZrZqhnTo4v3B4osbwgsuB5fUcDg
 RN12jRHoalUo1A0/Qt6gvKgr7DCw94eHC/t600A8OOEmQK+g3dlBCDJEFBaRvwbJOE+h
 kPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695075933; x=1695680733;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PTfnY9uWXPpDma/Afe6XSTglEi0hrKJxPetFRC40P0g=;
 b=NrbEq5G53JqzWJvF4UJCpsnAmt1AzVlPATmsr+LIIv/3auM0TgmDGtloAQVc9vaioK
 BHAIsjtDj3DI3ds+zhBApgEoW9I1V7hx8NtR1G49Kie+kJ6DGd+kNjBC9Tzr+0NjPy3y
 D4qhNHMlHE0HgQAnB3dtHauG3JD+T5WdDyfIWIZlmNcClXAIKPaj49N5PIua1+mp0Ay6
 jQ8owu1E0IU6T0OCXfj+X4YQwdp097MUEoWllv1y5VmUY6cRMCGWYK5nI1dtfIkOgtqr
 BWxnbBzyQtc5dBBLVq1P+HAvObBLd+PbMdr4fNxybq4a8STrZcJgfmkeR6OaPpkLVQOd
 po6Q==
X-Gm-Message-State: AOJu0Yxka0z1gV+ITA4bnSJg3epzKxQ/pHZ1lFcYfdXYpczTGUSI3zJ6
 kM+H+GD6GFOfBWTLspp1lspPHpiUtOFFYtN7nGnjUPnCqnc=
X-Google-Smtp-Source: AGHT+IFgLwSW3tXEhhmul4alOgHkfy/+R89UO6qjKblK8AotdA+YRBUVbQbKbofJiWV3eEL/QgykOJETU3+SZ0op+DA=
X-Received: by 2002:a05:651c:1a27:b0:2bf:fae0:5cf1 with SMTP id
 by39-20020a05651c1a2700b002bffae05cf1mr5434540ljb.14.1695075932596; Mon, 18
 Sep 2023 15:25:32 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 19 Sep 2023 08:25:21 +1000
Message-ID: <CACAvsv6c78-K4UQ-vduBoYCqAsQ9Xn2XPzAyJY8A_8EAhv8Vgw@mail.gmail.com>
To: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] Stepping away.
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

Hi all,

As you may have gathered from the MAINTAINERS patch I just sent out, I
have resigned from my position at Red Hat, and will be stepping back
from nouveau development.

This is a personal decision that I've been mulling over for a number
of years now, and I feel that with GSP-RM greatly simplifying support
of future HW, and the community being built around NVK, that things
are in good hands and this is the right time for me to take some time
away to explore other avenues.

I still have a personal system with an RTX 4070, which I've been using
the nouveau GSP-RM code on for the past couple of weeks, so chances
are I'll be poking my nose in every so often :)

I wish everyone the best, and look forward to seeing the progress you
all make on nouveau in the future.

Happy hacking!

Ben.
