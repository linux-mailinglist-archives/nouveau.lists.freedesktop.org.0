Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD882F04F5
	for <lists+nouveau@lfdr.de>; Sun, 10 Jan 2021 04:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567D46E928;
	Sun, 10 Jan 2021 03:31:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id E42986E8F6;
 Sat,  9 Jan 2021 00:52:47 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ky1e2-0007pu-00; Sat, 09 Jan 2021 00:58:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 804DDC086F; Sat,  9 Jan 2021 00:58:05 +0100 (CET)
Date: Sat, 9 Jan 2021 00:58:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20210108235805.GA17543@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 10 Jan 2021 03:31:44 +0000
Subject: Re: [Nouveau] [patch V3 13/37] mips/mm/highmem: Switch to generic
 kmap atomic
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
Cc: juri.lelli@redhat.com, linux-aio@kvack.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 bsegall@google.com, jcmvbkbc@gmail.com, ray.huang@amd.com, paulus@samba.org,
 kraxel@redhat.com, sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
 vincent.guittot@linaro.org, paulmck@kernel.org, mpe@ellerman.id.au,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@kernel.org, peterz@infradead.org, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, airlied@redhat.com, linux-snps-arc@lists.infradead.org,
 linux-mm@kvack.org, mgorman@suse.de, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, intel-gfx@lists.freedesktop.org, sroland@vmware.com,
 josef@toxicpanda.com, rostedt@goodmis.org, torvalds@linuxfoundation.org,
 green.hu@gmail.com, rodrigo.vivi@intel.com, dsterba@suse.com,
 tglx@linutronix.de, virtualization@lists.linux-foundation.org,
 dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, monstr@monstr.eu, nickhu@andestech.com, clm@fb.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, bcrl@kvack.org, spice-devel@lists.freedesktop.org,
 vgupta@synopsys.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 bristot@redhat.com, davem@davemloft.net, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> Hi Thomas,
> 
> 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> 
> Any idea what could be happening?

not yet, kernel crash log of a Malta QEMU is below.

Thomas.

Kernel bug detected[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc1-00017-gccb21774863a #2
$ 0   : 00000000 00000001 00000000 00000010
$ 4   : 00000001 000005cf 9e00059f 00000000
$ 8   : 00118173 809e6db8 9e00059f 00000000
$12   : 82023c00 00000001 810da04c 0212422f
$16   : 810da000 00027800 000005cf 80b4bf9c
$20   : 809e968c 82602400 810da000 0000000b
$24   : 021558f9 00000000                  
$28   : 820e0000 820e3928 80b10000 802710d0
Hi    : 0000346c
Lo    : 000002dd
epc   : 80271114 __kmap_local_pfn_prot+0x78/0x1c0
ra    : 802710d0 __kmap_local_pfn_prot+0x34/0x1c0
Status: 1000a403	KERNEL EXL IE 
Cause : 00800034 (ExcCode 0d)
PrId  : 0001a800 (MIPS P5600)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 7fffffff 820c2408 820e3990 ffffff04 ffff0a00 80518224 000081a4 810da000
        00000001 000005cf fff64000 8011c77c 820e3b26 ffffff04 ffff0a00 80518440
        80b30000 80b4bf64 9e0005cf 000005cf fff64000 80271188 00000000 820e3a60
        80b10000 80194478 0000005e 80954406 809e0000 810da000 00000001 000005cf
        fff68000 8011c77c 8088fd44 809f6074 000000f4 00000000 00000000 80b4bf68
        ...
Call Trace:
[<80271114>] __kmap_local_pfn_prot+0x78/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<802c49a0>] copy_string_kernel+0x168/0x264
[<802c5d18>] kernel_execve+0xd0/0x164
[<801006cc>] try_to_run_init_process+0x18/0x5c
[<80859e0c>] kernel_init+0xd0/0x120
[<801037f8>] ret_from_kernel_thread+0x14/0x1c

Code: 8c630564  28640010  38840001 <00040336> 8f82000c  2463ffff  00021100  00431021  2403ffbf 

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
