Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDC173C89
	for <lists+nouveau@lfdr.de>; Fri, 28 Feb 2020 17:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A856E08C;
	Fri, 28 Feb 2020 16:06:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from elasmtp-curtail.atl.sa.earthlink.net
 (elasmtp-curtail.atl.sa.earthlink.net [209.86.89.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F5B6E08C
 for <nouveau@lists.freedesktop.org>; Fri, 28 Feb 2020 16:06:04 +0000 (UTC)
Received: from [24.144.102.41] (helo=[192.168.0.11])
 by elasmtp-curtail.atl.sa.earthlink.net with esmtpa (Exim 4)
 (envelope-from <mrmazda@earthlink.net>) id 1j7i9L-0005EE-2i
 for nouveau@lists.freedesktop.org; Fri, 28 Feb 2020 11:06:03 -0500
To: nouveau@lists.freedesktop.org
From: Felix Miata <mrmazda@earthlink.net>
Organization: less than infinite
Message-ID: <105a5043-8cc0-43cd-42bf-a79cafbd2320@earthlink.net>
Date: Fri, 28 Feb 2020 11:06:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 SeaMonkey/2.49.5
MIME-Version: 1.0
X-ELNK-Trace: 7235c9a3853724b974bf435c0eb9d478b284097863195836b3d8dca13ba00b3216699a1566c2d094350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.144.102.41
Subject: [Nouveau] where to report modesetting DDX bug?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Video and input drivers Subgroups and projects on gitlab does not list modesetting
DDX, presumably because it's not packaged separately from the server. Where's the
right place to report a modesetting DDX bug that manifests only on an NVidia GPU?
Directly against the server https://gitlab.freedesktop.org/xorg/xserver?

Here are some particulars:
How can I tell whether this should be reported to kernel tracker or to freedesktop
tracker as driver or server problem? HDMI output on GT218 10de:0a65 GPU is limited
to 1920x1200. When connected to 2560x1440 display, vttys are supported at
display's supported 1920x1080 mode, but X with modesetting DDX puts display in
unsupported mode (functionally asleep) regardless of various attempts to force
1920x1080@60 or 1600x900@60, while with nouveau DDX, or 1920x1200 display, or
2560x1440 display with Dual-link DVI cable, display behavior is as expected.

openSUSE 15.1/kernel 4.12.14	OK
openSUSE 15.2/kernel 5.3.18	bad
Tumbleweed/kernel 5.4.14	bad
Debian Buster/kernel 4.19.x	OK
Fedora 31/5.5.5 kernel		bad

http://fm.no-ip.com/Tmp/Linux/Xorg/xorg.0.log-gt218-stw-modesetting-OOR-0x1e
http://fm.no-ip.com/Tmp/Linux/Xorg/gt218-dmesg-stw.txt
-- 
Evolution as taught in public schools is religion, not science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
