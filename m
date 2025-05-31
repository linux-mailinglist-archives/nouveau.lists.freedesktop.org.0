Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CABAC994A
	for <lists+nouveau@lfdr.de>; Sat, 31 May 2025 07:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E15B10E25F;
	Sat, 31 May 2025 05:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYzmasqY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92A10E264
 for <nouveau@lists.freedesktop.org>; Sat, 31 May 2025 05:02:18 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4e592443229so817995137.1
 for <nouveau@lists.freedesktop.org>; Fri, 30 May 2025 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748667732; x=1749272532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:subject:to:message-id:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GXQolQhK00SgM5ZcyYNLwOAxNp0deIKhZHtgWBLgdJw=;
 b=JYzmasqYr/iwUKB3w7PafwdVwHomSP319D/e32vfWT4WJkoGKZE1bHw4YNXg5bXGjO
 YFNsHE6fYmEwejngn4m2p3bJTvBOwBWnfzsITuwG8VD1dFrzipa09a2FWoYtwSwPX84U
 T5Ae5SImKOE5+HuC1fYN9F/UjdDLB+g52hssCZ4FcyawmvpBa25/tsZq4ZAIpQm+O+HT
 eqOiVc1TLbzoLFy0JGZFQrQy45NRj8NMSDXBosYJtNNc6uf8oklkw/3jIv28i5YnImuu
 w6ug7XVIok0ZHzmvQe/pnW7BvHhCv5cz1q/PplFGXoVbDGgPM7ARd+7f6sJYnJs8C767
 jWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748667732; x=1749272532;
 h=content-transfer-encoding:mime-version:subject:to:message-id:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXQolQhK00SgM5ZcyYNLwOAxNp0deIKhZHtgWBLgdJw=;
 b=EQD+2PXoMHe6fk1eLrO3YGPn8tUosV39HVYkc1rlnbyilyF23HmYuYhDv92JL2iZOE
 RKYIvgl7QZJMsdCbyi+rNLl/rixmUpj6OFEmlz8ATCxPp9GH+c921WMngu9rnX4uTkMD
 MRXmE2tzBSXNT9oQBHiIlUZg0o16kJO0S4VvnFMYmgr0dJE/q293JQwzrT6GBlso+hAq
 owe90kBQ3aUwGoVZZQxs6ijLKQr0KGgLiM4TfX70sjO9DnblEqG415tRG8XPju6G9+wh
 4z006ZE2bsKdNccs2qp7pG4VmWkfrb0+a6mSuLI9hCirC+CYJMExu9hQCIVNUx5sRif9
 yrrg==
X-Gm-Message-State: AOJu0YzC0LeyCrefSXCrwCXFZ/LRcso474rbTR120bxx+eSrXIIofcKp
 az/jq/Ouy0Coy8H5TJF1tlpioJuiQlQgTdlE8VQZhwS9XU/RaskzhQlhr8c/Hg==
X-Gm-Gg: ASbGnctwqUYmhBE8FvlYCnydSpU4HEjgu/ehzR7zi31swbOV6nYdYyoKzDyWgaeAABJ
 mJpC6kOZfNkDtNWIp8DROLjdEulNSTToxQq4SB9GA/xkSuWe8dQI+SYoJ3EekwueQJ2zOil78dy
 yo5LsthAK6aJUvKv8nlzYa4vX/4EqT9VgHNlNYilNehLHqx1ALC/a6h3aaQWiloNCBeh+u7/+Rq
 S+Q+eIStVJsNNdgMEGOVsUjzkHdokd9SjIYISbL65CmfTzIx+kS81GmX6zev1es5JeaXB67/GIl
 YP3UrnCRL0YV6ClxnkONu4/wXWqDITuMstNENiNZj9r2FxLaVlDBqoctucA=
X-Google-Smtp-Source: AGHT+IG3VNHXMDSDlzXP2EGieiHhOsIKFzXPwLCjTsFMj0Vd51K80nDQRJeb8MzNlncqJpcixCjH8w==
X-Received: by 2002:a05:6102:8023:b0:4e4:8362:dce9 with SMTP id
 ada2fe7eead31-4e6e40f5c6cmr6212178137.9.1748667732167; 
 Fri, 30 May 2025 22:02:12 -0700 (PDT)
Received: from [192.168.1.184] ([185.214.98.253])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4e6444964casm3961203137.13.2025.05.30.22.02.11
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 May 2025 22:02:11 -0700 (PDT)
From: G2 <g2subspstlc@gmail.com>
X-Google-Original-From: G2 <G2subsPstLC@gmail.com>
Date: Fri, 30 May 2025 22:02:10 -0700
Message-ID: <1818914354.20250530220210@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: nouveau, a few errors in dmesg output
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

hey,

on an older asus gv75w running parrotOS with kernel Linux 6.12.12-amd64, a few errors, see below, regarding nouveau driver shows up in dmesg output. this is a fresh new OS install.

are the errors the result of the nvida license issue or is it something else warranting more investigation to fix?


#---[ sudo lshw -C display, (shortened output) ]--------------------
  *-display                 
       description: VGA compatible controller
       product: GF114M [GeForce GTX 670M]
       vendor: NVIDIA Corporation
       capabilities: pm msi pciexpress vga_controller bus_master cap_list rom fb
       configuration: depth=32 driver=nouveau latency=0 resolution=1920,1080
#-------------------------------------------------------------------------------

#---[ dmesg errors ]-------------------------------------------------------

May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: init failed, -19
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: msvld: unable to load firmware data
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: Direct firmware load for nouveau/nvce_fuc084d failed with error -2
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed to load nouveau/nvce_fuc084d (-2)
May 25 08:51:40 parrot-33 kernel: nouveau 0000:01:00.0: firmware: failed to load nouveau/nvce_fuc084d (-2)

May 25 08:51:34 parrot-33 kernel: nouveau 0000:01:00.0: drm: failed to create ce channel, -22

#-------------------------------------------------------------------------------

regards,
wb

