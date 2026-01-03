Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAAACEF9DE
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 02:14:23 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0B10E301;
	Sat,  3 Jan 2026 01:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Khar1UBq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B510344C81;
	Sat,  3 Jan 2026 01:06:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767402375;
 b=Ee9n9KLOypsjduWmT/eD9ZYX+dnlIrFSCApDoykgmz6B0cp/+AbcguPC1JOccg53+52gQ
 QzRKyvzFfLNZHXgWHmQsa0aLaBBO2iWW4ic9KWzBtXOAVxtWsm15szD760GZGJU8e7RGHS6
 +B0Can5u9UFxbKGndzeJiJgzDnAZ8r+K/StghHkajeConTwp9XU9VTRvqQ8rrvlW0FO+CaC
 b0YTIGog9u00v8uNYGm+yaQylPy5X1vg//hInrHAfoMaB+kUEg9uiczQRMXUvaHLUJaGTJQ
 VSehV37X/iWHfS4Qg1PDQ31pMn7d++SQaizJWMvmrEcmwSyLMoMYW71s0SEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767402375; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NemJ2jl01K/96BnCw2JBFy1QqTyG7+BwqGzSxlXV+5w=;
 b=G6Wze0dLf3GQV5OrZ4G4MERCk+t0+bGmGGzbPtyADgbv0Ll//t7cgdvRjYy7qqJXEzcb3
 XaNapMY119HiP+cjo2tU3c9lkeNOjbwcv1B5R8fVW1Hw3A1prgQr1sX4gpcBa1s/Aa3faxt
 E7AP2pu5zMWlA3ITCJ6+vmLPtq8h9VW02e9uuUAitsxTgYZ4/tPaT4LyKWaOKbfZJgEP6kF
 g+3cNrplQZ7FJtx40dYM4MVtPhHnkvXGhAlnatHUzcaI6Dz2++kER7WkZUo5pmtAmLbSkKn
 Te8fQ1GYE5hU8Gb4xgrpY2i/TX88XBtHeL/ZwN6FytrYtt7QAjqNUxcxS+Zg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ADE4944C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 01:06:13 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA8B410E123
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 01:14:18 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8b1bfd4b3deso1137991385a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 02 Jan 2026 17:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767402857; x=1768007657;
 darn=lists.freedesktop.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NemJ2jl01K/96BnCw2JBFy1QqTyG7+BwqGzSxlXV+5w=;
        b=Khar1UBqH2Ns1a08LFBQswAr72uzHMDS0rRqErnabUkyGPlnEx/mIOHaf1Jxscaeqd
         yqaWkn5+sPDhiRXbaQIu7B5L4f4wngxq73K3yXyMGFMS29eV9CcoQKOgZ1kCl+qlDkS3
         KGLGXNGwbwIWQHV88MTZ2EXPxDAHloxlF1RR6pM/reSvgq5CDokN104/XPE4PSG9icLL
         EmqgmlHwpfdwECsNKFzTOeseDQgglDR2N8bcV52BgC4jSjAPLTtWnW7BdEV3M9Wgk4xi
         YiA4F8gD8BlI9oJ3gTNmITazKZXTcguf1F+chkt0pcyy5CMXzLEF8iun9hwvkivnTJ/4
         CQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767402857; x=1768007657;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NemJ2jl01K/96BnCw2JBFy1QqTyG7+BwqGzSxlXV+5w=;
        b=YdcTqnOA3SjXbTbX32LHuWPWfNPNSOqzKgrzLprUD1cxv8nVzViBGIljU7h7YlMnq1
         K0qyXKQKCsh04viQ8/RMQwAeLyLa8c9D0quqm7DFxIjb/DA9k+F8Al+FHyhqNOzhvhVm
         xbIrrAEonf8fEtqO4MMAZ2oi/mu6bpGfTLqcjfkmpeqU8L65EF0kZfbOnAToYGC86+Ay
         Xe/1jlNfmsZ33crX6d2BTK2f7FQAEoqPyQ+q1V6P4tYhjznKzmKILkGcG1jZQZ6CRu4N
         egsywh+TrUtPgPUIDIT4O5GXzmumxXayqNHMxb3ieCfeMDkUV8M7lf3mX11WXL1W3KUi
         MUpA==
X-Gm-Message-State: AOJu0YzNXJUki2NdZ8amTiBBo1iZw12g3YVDRmACHYmSwd4d1tUXwws9
	QCm7ZqNWNuBceXZ87i/7NN/vqs0uKCX7JWvyaa1r0L4kZFyMGC+BRMWzAfK2Fl5yGsUYng==
X-Gm-Gg: AY/fxX73Dk5V07TE+5/HA52AWED33tzcjZD63+C8PT1gkHzCEzt7ZT5mE9D/WhbjcHv
	CWg0DeRTt1FinxZSsoUcXOQ+lXrpxBvVFTuMk5Ik4KMwnp8THgN9Qv82q55qZQuZ2FVbFV0+S9X
	MQgiS+3ScYzwCqJThXJhlIWWClyK7PzjEtiSejCf7+L1GDuzMwuvFk2rMCYzFYJe1+YSnEHcWbX
	GDM2QRbE+tFngloaGl9Fff6FxIDDNIsWc3tvAQEsOfQhs4760mjbjprvDvQJIsi/9YnNnLPRUtL
	BeaNWhi31kCrwLY1jGzFaaLx1EoIjkkMoznQGel7/bbzW5N8z574NpEOfhBxQKQVIozbjr4x8vs
	Cbz0WDf8ZK94r5szKmO+hdSriGXiW+6qB5yjU7i896NGOftx9cwCF/w8p351sQYFDTygOmWiwG2
	lstrwkjH1LLGhHJEEQQGsUHMZghUnNF5Dw0Up/FVQkF9kH1UtUMDYbvrqhzCv+wS05
X-Google-Smtp-Source: 
 AGHT+IG0cBwbI8QljKbaE/mGCxuTC+9+FznV2jShGvpPxjCKFub3RliVEZCaXpfgLHVzIFE3UNHv3w==
X-Received: by 2002:a05:620a:400d:b0:89e:b3a0:bce9 with SMTP id
 af79cd13be357-8c08fd03676mr6749645885a.22.1767402857091;
        Fri, 02 Jan 2026 17:14:17 -0800 (PST)
Received: from smtpclient.apple (172-97-228-129.cpe.distributel.net.
 [172.97.228.129])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c0970f5fdasm3310307785a.35.2026.01.02.17.14.16
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Jan 2026 17:14:16 -0800 (PST)
From: Dominique Derrier <derrierdo@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6.1.21\))
Subject: GT730 / turn off screen - black
Message-Id: <6E83FAE8-5EC5-4634-8943-774BF23CE05A@gmail.com>
Date: Fri, 2 Jan 2026 20:14:02 -0500
To: nouveau@lists.freedesktop.org
X-Mailer: Apple Mail (2.3731.700.6.1.21)
Message-ID-Hash: KIS76UMPWJBUXAF42B6ZAU6IK2J6HZE4
X-Message-ID-Hash: KIS76UMPWJBUXAF42B6ZAU6IK2J6HZE4
X-MailFrom: derrierdo@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KIS76UMPWJBUXAF42B6ZAU6IK2J6HZE4/>
Archived-At: 
 <https://lore.freedesktop.org/6E83FAE8-5EC5-4634-8943-774BF23CE05A@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi folks,


II am trying to install an old graphic card, a GT730.
Proprietary drivers are no longer compatible with the latest kernel.
So I tried the nouveau drivers on my Ubuntu LTS without success.

When the nouveau driver loads, the screen turns off/disconnected and =
stay black.
When modeset=3D0, there is obviously no 3D acceleration.

I also  tried several bootable distributions without success
- ubuntu 25.10
- fedora

I am probably missing some configuration.


=E2=80=94=E2=80=94 when nouveau loads / but screen turn off.
Graphics:
  Device-1: NVIDIA GF108 [GeForce GT 730] driver: nouveau v: kernel
  Display: unspecified server: X.org v: 1.21.1.18 with: Xwayland v: =
24.1.6 driver: X:
    loaded: modesetting dri: nouveau gpu: nouveau tty: 190x40
  API: EGL v: 1.5 drivers: nouveau,swrast platforms: =
gbm,surfaceless,device
  API: OpenGL v: 4.5 compat-v: 4.3 vendor: mesa v: 25.2.3-1ubuntu1 note: =
console (EGL sourced)
    renderer: NVC1, llvmpipe (LLVM 20.1.8 256 bits)
  API: Vulkan Message: No Vulkan data available.
  Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, =
xdpyinfo, xprop, xrandr

Regards,
Whoo.=
