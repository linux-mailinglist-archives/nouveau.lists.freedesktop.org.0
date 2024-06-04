Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4409F8FB705
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 17:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432178944A;
	Tue,  4 Jun 2024 15:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aYmg615d";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C5210E4CC
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 15:27:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52b962c4bb6so4123370e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717514855; x=1718119655; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Bv4FvK7JfBKT6PTxTx8OUYUCncSn7CogedH3sMEZfVo=;
 b=aYmg615d7bNIBdeaYVSf2OjtI1BpnCAI1OXQqesVUuXFp+ERM4Q5TmAo6ylbNBMIkO
 zOoxCmUs9V1tQ8QYdO+bQ3ytQxgLvc1jL90CXWGSwuKAQhc6crcp5KLi8P5mdZ4rXzwu
 oC8Nf3RcbsuhnCDX9G9MCWi5oWJ6YPYUyMPloA93VVyRxSTsWPdIg1JxRMcMktkIm8qN
 SfqFL3N8gN6fb24mB9M3KQTw2fCCF0gY9grVLRow0E5N1XlygBHhBYkmtxArg6Jbw/y/
 2qUzwy/y5f61aRTxOdvp6f1QvAmVzYq3jIAZ9vsDjH4Dr+gZk0z6XVV/8dHFoH2z/J4p
 l9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717514855; x=1718119655;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bv4FvK7JfBKT6PTxTx8OUYUCncSn7CogedH3sMEZfVo=;
 b=mEzELyce375meVmBp92fQWGu9c8fKZDNJpCHG4y1EvyXIGr55jWb1ve9iCFOsx/vlI
 pglubmJ2nh5CJBuu5+s5nybjeiExiCbwVMmV1UZJjJNiPw15UIjUQP2iA8fDB2zfykmX
 Ib/9C0bnRh9coMT+jFrw6XjsECbS44SClfUgptAcTMis1horB5bdufysrLl88dub1QqX
 2ugt+ZpF2ymg0VbvzZcyvimyDcXLVfj5C3Atjdoz3V+Z42o0BDhLZeOd8+GvVODutQUI
 cHg62JzKRYlh4k2rgrWe0RmTh+nRbD5SXRP57k1EKbXUTs4f883wk9ea2WChX1Se++mZ
 y9FQ==
X-Gm-Message-State: AOJu0YynQu7ql4maAzCI39jn6PyLZ6QjXPtPhpX9QQsA8hGTXuQlePjP
 c3aJDg8uLkfW49y7ROqpuWLMcEQdJGjEbfKefMgZ7ibUYzSWDTp3HPv45tQUoxVHcV/UOJsQKQp
 TByTQZfzF0/RoUVQjKiDXywrsmQCl2faTLAw=
X-Google-Smtp-Source: AGHT+IFBpilxctK0iIKQF5WyQ70rHSGFwqezqlT/fJnUjIZDLuZ2cVxTQyS45/17dAcdC2LWOZJs96cob4o9uq83A6U=
X-Received: by 2002:ac2:4d83:0:b0:52b:fb4:1283 with SMTP id
 2adb3069b0e04-52b8954e82cmr10542875e87.15.1717514855125; Tue, 04 Jun 2024
 08:27:35 -0700 (PDT)
MIME-Version: 1.0
From: Blake McBride <blake1024@gmail.com>
Date: Tue, 4 Jun 2024 10:27:23 -0500
Message-ID: <CABwHSOvVc5ZbGv=zj9CJJfkO=aU+X2_W8ms816dufVx2P7LSvg@mail.gmail.com>
Subject: LLM GPU Support
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d61da7061a1216f7"
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

--000000000000d61da7061a1216f7
Content-Type: text/plain; charset="UTF-8"

Greetings,

I have used the nouveau driver with my Nvidia card on Linux.  Works fine.
However, my problem has to do with running LLM on my GPU with your driver.
My impression is, it doesn't work.  Am I correct?

Given today's environment, this may be a good FAQ.

Thanks!

Blake McBride

--000000000000d61da7061a1216f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br></div><div>I have used the nouveau driv=
er with my Nvidia card on Linux.=C2=A0 Works fine.=C2=A0 However, my proble=
m has to do with running LLM on my GPU with your driver.=C2=A0 My impressio=
n is, it doesn&#39;t work.=C2=A0 Am I correct?</div><div><br></div><div>Giv=
en today&#39;s environment, this may be a good FAQ.</div><div><br></div><di=
v>Thanks!</div><div><br></div><div>Blake McBride</div><div><br></div></div>

--000000000000d61da7061a1216f7--
