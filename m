Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F89C0A40
	for <lists+nouveau@lfdr.de>; Thu,  7 Nov 2024 16:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF8E10E032;
	Thu,  7 Nov 2024 15:40:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142910E032
 for <nouveau@lists.freedesktop.org>; Thu,  7 Nov 2024 15:40:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 066485C4D02;
 Thu,  7 Nov 2024 15:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BE9C4CECC;
 Thu,  7 Nov 2024 15:40:17 +0000 (UTC)
Date: Thu, 7 Nov 2024 10:40:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: Zheng Yejian <zhengyejian@huaweicloud.com>, <oe-lkp@lists.linux.dev>,
 <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [linux-next:master] [tracing]  49e4154f4b:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <20241107104022.47f2b527@gandalf.local.home>
In-Reply-To: <202411072207.b2321310-oliver.sang@intel.com>
References: <202411072207.b2321310-oliver.sang@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 7 Nov 2024 22:25:23 +0800
kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:
> 
> commit: 49e4154f4b16345da5e219b23ed9737a6e735bc1 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 850f22c42f4b0a14a015aecc26f46f9948ded6dd]
> 
> in testcase: boot

The commit in question does not even get executed in the boot process
(unless you have tracing on boot enabled). So I'll simply ignore this.

-- Steve

