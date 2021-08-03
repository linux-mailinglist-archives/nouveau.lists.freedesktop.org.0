Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D013DE84E
	for <lists+nouveau@lfdr.de>; Tue,  3 Aug 2021 10:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1BA6E406;
	Tue,  3 Aug 2021 08:23:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE54B6E406
 for <nouveau@lists.freedesktop.org>; Tue,  3 Aug 2021 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627979008;
 bh=VGrqiqPLxK1ao+MaE9xJ2BrGfoKdHhReKUOOSiouZ9w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RbqhUugBsu30ACFlBNsYjRt3CMHKIdS9hn0RnOf7mPCjYQlXhypVjjWHjN8B7H65u
 Nr8Vdq/MuIV14tPbdgWhQp+GwDWXqrzr5zFTw5JwxyhbfJSyGVe+ttvUGSJHTpvhu3
 OYPxVtsXiKeOv9zuasvJQIWdyZ+PzV6LtPyFZhc0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from apollon.localnet ([88.130.48.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1mIlaV0sYP-00CNWm; Tue, 03
 Aug 2021 10:18:22 +0200
From: Reinhard Karcher <reinhard.karcher@gmx.net>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Date: Tue, 03 Aug 2021 10:18:19 +0200
Message-ID: <2027407.lYD7Z9Tp6P@apollon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ofE2YgAU3IidQH9WHqXXlQ+TFjDuOnwWlvRSRTv9ePDfq+28Q4Q
 juqCxNVFjGBuGlvI3sQFQ9PXvJ2IgQTrwUgb+qKJVp2lRpQqKMc21VbicvQebhpj/Zs3XGN
 cHUHtfbO/HlYX1xxzI5AQ4/71ZEIet/PQpG8j0XIQbmlIvF7g5fRUCSNOEf3r9p+wJp7VnT
 L0PfleAwG8OhChDXTKySw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ua4AIW6kfhc=:aOu/uXT2in8HAqJOLU6AfG
 i1lPEPF25yOBA/EBxnidK56EcHCIqdLlSmlHdxjjw6uzeB5D0GB+8NBn99AXV/pPw5Vt0EjMq
 7trFISrP4Sec7nZ2xlb7raBgX3uBg2c9+CCKhusKPhrmkGy7VEL/RowQK/lYWkdu3r+QlzVBl
 QGBCN1TwNssDS1X3h7WmwIHnZNWFaQSLzcG1XyzVxdMhtOR8VzA0HJtoWxKENmqMIcg+UMaxx
 XeBuq4E91sUN5TSL2a+nPHykivpWPKKQ5Den6yr4DxYXgEwx3c7lkHubglyr2ljwAfiJhrXkj
 cDYWKpQRhC0Fs8TgUdPIzhoowPtpSFwrtjxjUvhkpps7hMWO/ymi1cQTb0wonDNlsxH200C4N
 l4ASywDDzGn9KAphc9DXt+dHLvx90v4GoR2zHfDVWAps4b0PmsTieODxOIIYx0gGV30Ua9aDh
 7qE5sCrrfbN9orUUONd6HYntiFiuBYpj4p9XAdzfMLCXVle8uxE1NJPiWlrDd9UwhXSZxKSlH
 2yZix1jXkZvNh6d4a+CKhHC/zagE3EzxRGyNRCNBxfZlLgrIk+TdaPu2g7X8IYKE8h4WghEVD
 WSYkEHXDX5Rdy3dLJn/MxAqx3rfHA5X7TQQHKnRQM5DjCBqpCuVOAqQb4otpZD3p4SZ2EwO7+
 nXCgq0Y6Gir8Au2VN72IIhKwBaF4CWMeVinZFryXjQqK0PAu0v5Iy/VHb7NaRJ9t8w/ndHFtt
 qKYL28iKPtDQ52SzPpRtv+LJstwBz6BvnNVYvFhD9iQ8nuwuDbC1/NS8jS57edE4h2KlLzMlR
 FSjMsdm/cuJkQPCRTDmdl1ju7rASGrUM4QZgngrpFCbPdR8EJwE/S/x8UBL4DZj703EZzAmuA
 ToPl7BcQIVjxsSwRWzeRlE2N2mUX2xAaVqDJM3BjaoMU43admuFlkiZJkVmHL+XHyo0nU3mvU
 o4a2RgT/CfjzwpzJjuUUQYVorybNp5X4wHXjqRkiH9gQ5C/8b1Sm0D6k56VsjfY3V5sj5S+QH
 VXteaZ4Pu1hXRzESybFxWpsKIHJpPrZ5+0iT02R/EFijWeD2Ag/jmaMKVZIok2nTknmF+D0X/
 YlvkEmUfK//souwqOlDZurG2U/xEW+7Ez0aJgSjLsM6lGCRyKZoa9gCtg==
Subject: [Nouveau] falcon limit(s) exceeded on GF108M [GeForce GT 620M]
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

Dear maintainer,

I own an old Fujitsu-Siemens Lifebook N532 with Intel and NVIDIA graphic.
lspci:
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM Controller (rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor Graphics Controller (rev 09)
00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset Family USB xHCI Host Controller (rev 04)
00:16.0 Communication controller: Intel Corporation 7 Series/C216 Chipset Family MEI Controller #1 (rev 04)
00:1a.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 7 Series/C216 Chipset Family PCI Express Root Port 1 (rev c4)
00:1c.1 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 2 (rev c4)
00:1c.2 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 3 (rev c4)
00:1c.5 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 6 (rev c4)
00:1d.0 USB controller: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation HM77 Express Chipset LPC Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family 6-port SATA Controller [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 7 Series/C216 Chipset Family SMBus Controller (rev 04)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 620M] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio Controller (rev ff)
03:00.0 Network controller: Intel Corporation Centrino Advanced-N 6205 [Taylor Peak] (rev 34)
05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 07)

and get when booting the error message:
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: init running...
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: one-time init running...
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: falcon version: 0
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: secret level: 0
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: code limit: 0
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: data limit: 0
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: one-time init completed in 5us
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: firmware: internal (static code/data segments)
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: ucode exceeds falcon limit(s)
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: ce: init failed, -22
Aug 02 09:18:10 apollon kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10312c [ PRIVRING ]

As the laptop uses Optimus and I don't need the enanced graphic,
the NVIDIA hardware is always switched off.
So I don't have any problems using the laptop.

The kernel is a selfcompiled vanilla kernel using the git repository.
If I remeber correctly, the message started with the 5.11 kernel.

If you need more information, feel free to tell me what you want to see.

Reinhard



