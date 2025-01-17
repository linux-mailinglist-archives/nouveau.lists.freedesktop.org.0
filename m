Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D622CBAEF8
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72EA10EC52;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABEqRy9q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D848C10E205
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 21:38:38 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30227ccf803so22944911fa.2
 for <nouveau@lists.freedesktop.org>; Fri, 17 Jan 2025 13:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737149916; x=1737754716; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R+sEC43MTLW7s5/hUQjXwzHtBrFiyUSAtrcUHGeR3ng=;
 b=ABEqRy9qHcvza6X791Gd2rtNISAgXCLHQI0XORqvHd7oakQzVZjggxnEkdiYIG8NJw
 9HsLQSuFn2xskgcZxiGjSUT7EaWUr3pG2ojNXeBNwFJQW66hTy8pHrdGv1CT7/4BB/bD
 EobLbRvnKbbYHCsxcMPc5AZM1bA+PrQWi2xymHKjn79EdMypAe9I/7mLagKa5FUx5E8V
 SmKdP+7LOvR8d06Q6T+P3M2DUcXXC+6p/VdJHGYfu4W/6A3QjqUPV6xbBBFFnuZX4ErQ
 +0b9NH8d93BuqNvEX+ZwkXf6x08uscDXztZ2USdKULHB1wTcEknfJ1RSLUiEZN9+xQZE
 CamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737149916; x=1737754716;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+sEC43MTLW7s5/hUQjXwzHtBrFiyUSAtrcUHGeR3ng=;
 b=j/BM7+4FtMVYssqSfaXg3xAVClcGe4XWEaksg+bk1SLlekZmdnjT9CAV2WERLCYhJq
 vnjXgnIEv9rJz/bkvW1WBrvlvf5sOOi/IDPJepAZ7wm/sSCfzfS4M7TWuGUuMw4inKv3
 shaHXnAIe/yuvrA8FWnuviC4M1w9VuYoX/ayTdGsc8POjbAyudjk8yQPHP9ChLoeXYCG
 lhis7mW03NoyWcv/NYPpbpQ5lgAmaCSjRUTnlTzOW8od1yzcEYgvYRADUdOTWDfzd2/s
 0ETBi7Axc/g1/xe0S9ninyeQQRG0PjNBA3HMuZ9A5J+SgdzNxI6Vm8WR493kSZJUku6y
 OUJA==
X-Gm-Message-State: AOJu0Yz3I+gO+kwrTMdSwsA0/l5BzO70rmh5CZHeqAbevotTEzD6jdcX
 hi9h8g34nCah/Wks7cq/EdY0QoWK/21nDdSJz6QfoQVyNhwwXBK0p/q+DrLM97mvcQwBZoTifho
 FkCeaAvwexMYjElDZVB26yowpk4ctgg8tTkc=
X-Gm-Gg: ASbGncsjZhvL8DvoBqqPfPO8SMi2cdpGFtQwqxxBk/2Yq1lAM2p07RbXkkj+zXIIeD8
 eZOdBH+tk5FgA9GvNZXzp7DWqzmXbbhijQw4ZwQ==
X-Google-Smtp-Source: AGHT+IE09mufhDsc1zOcrEeT3pHsclF1FrKt5o8o9b3BQarKQLYDcthrzle3/fpI0V2igIyGPV8wCSdyWYZNpYHjRg0=
X-Received: by 2002:a05:651c:10af:b0:2ff:cb47:3c77 with SMTP id
 38308e7fff4ca-3072cb1f2bdmr15111031fa.26.1737149916198; Fri, 17 Jan 2025
 13:38:36 -0800 (PST)
MIME-Version: 1.0
From: Serkan Kurt <sserkk@gmail.com>
Date: Sat, 18 Jan 2025 00:38:24 +0300
X-Gm-Features: AbW1kvZOqM2H4JvUxOsoN7iCAAZnkHyUcgNnKf20BioHVbgXJXL76MjqJ7oxOUI
Message-ID: <CABbDMJB-SitepFJXVfiiv8JECJyca0dtYR=rV7Ycm3Us0TaRPw@mail.gmail.com>
Subject: Texts on the Blender screen are not visible. Error messages for
 Nouveau appear in the dmesg output.
To: nouveau@lists.freedesktop.org
Cc: 1092189@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Hello,

I have an NVIDIA 8600M-GS graphics card on my computer. The texts in
the "Blender" menus are not visible on Debian 12 amd64. I provided
more detailed information at the following address
"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1092189". I present
it to your information.

Best regards.
